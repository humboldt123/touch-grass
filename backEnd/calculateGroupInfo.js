const supabase = require('./utils/supabase'); // Ensure this path matches your Supabase client path

async function calculateGroupInfo(req, res, next) {
  try {
    const { data, error } = await supabase
      .from('person')
      .select(`
        groupNum,
        Year,
        Personality_Type,
        Introvert_Extrovert,
        Minority,
        Educational_Disability,
        Physical_Disability,
        Degree_Acquired,
        Astrology_Sign
      `)


      const currentYear = new Date().getFullYear(); // Use the current year for age calculation

      // Processing data to calculate group-wise statistics
      const groupStatistics = data.reduce((acc, curr) => {
        const group = curr.groupNum;
        if (!acc[group]) {
          acc[group] = {
            totalAge: 0,
            validAgeCount: 0,
            personalityTypes: {},
            introExtroStats: { Introvert: 0, Extrovert: 0 },
            educationalDisabilityCount: 0,
            physicalDisabilityCount: 0,
            degrees: {},
            astrologySigns: {},
          };
        }
  
        // Aggregating data for non-null Year values
        if (curr.Year) {
          const age = currentYear - curr.Year;
          acc[group].totalAge += age;
          acc[group].validAgeCount++;
        }
  
        // Collecting other statistics
        acc[group].personalityTypes[curr.Personality_Type] = (acc[group].personalityTypes[curr.Personality_Type] || 0) + 1;
        acc[group].introExtroStats[curr.Introvert_Extrovert]++;
        if (curr.Educational_Disability) acc[group].educationalDisabilityCount++;
        if (curr.Physical_Disability) acc[group].physicalDisabilityCount++;
        acc[group].degrees[curr.Degree_Acquired] = (acc[group].degrees[curr.Degree_Acquired] || 0) + 1;
        acc[group].astrologySigns[curr.Astrology_Sign] = (acc[group].astrologySigns[curr.Astrology_Sign] || 0) + 1;
  
        return acc;
      }, {});
  
      // Calculating averages and percentages
      Object.keys(groupStatistics).forEach(group => {
        const stats = groupStatistics[group];
        stats.avgAge = stats.validAgeCount > 0 ? stats.totalAge / stats.validAgeCount : null;
        Object.keys(stats.personalityTypes).forEach(type => {
          stats.personalityTypes[type] = (stats.personalityTypes[type] / stats.validAgeCount) * 100;
        });
        stats.introExtroStats.Introvert = (stats.introExtroStats.Introvert / stats.validAgeCount) * 100;
        stats.introExtroStats.Extrovert = (stats.introExtroStats.Extrovert / stats.validAgeCount) * 100;
        stats.educationalDisabilityPercentage = (stats.educationalDisabilityCount / stats.validAgeCount) * 100;
        stats.physicalDisabilityPercentage = (stats.physicalDisabilityCount / stats.validAgeCount) * 100;
        Object.keys(stats.degrees).forEach(degree => {
          stats.degrees[degree] = (stats.degrees[degree] / stats.validAgeCount) * 100;
        });
        Object.keys(stats.astrologySigns).forEach(sign => {
          stats.astrologySigns[sign] = (stats.astrologySigns[sign] / stats.validAgeCount) * 100;
        });
      });

      Object.keys(groupStatistics).forEach(group => {
        const stats = groupStatistics[group];
        stats.avgAge = stats.validAgeCount > 0 ? (stats.totalAge / stats.validAgeCount).toFixed(2) : "N/A";
        Object.keys(stats.personalityTypes).forEach(type => {
            stats.personalityTypes[type] = ((stats.personalityTypes[type] / stats.validAgeCount) * 100).toFixed(2) + '%';
        });
        stats.introExtroStats.Introvert = ((stats.introExtroStats.Introvert / stats.validAgeCount) * 100).toFixed(2) + '%';
        stats.introExtroStats.Extrovert = ((stats.introExtroStats.Extrovert / stats.validAgeCount) * 100).toFixed(2) + '%';
        stats.educationalDisabilityPercentage = ((stats.educationalDisabilityCount / stats.validAgeCount) * 100).toFixed(2) + '%';
        stats.physicalDisabilityPercentage = ((stats.physicalDisabilityCount / stats.validAgeCount) * 100).toFixed(2) + '%';
        Object.keys(stats.degrees).forEach(degree => {
            stats.degrees[degree] = ((stats.degrees[degree] / stats.validAgeCount) * 100).toFixed(2) + '%';
        });
        Object.keys(stats.astrologySigns).forEach(sign => {
            stats.astrologySigns[sign] = ((stats.astrologySigns[sign] / stats.validAgeCount) * 100).toFixed(2) + '%';
        });
    });

    const groupInfoStrings = Object.keys(groupStatistics).map(group => {
        const stats = groupStatistics[group];
        return `Group ${group}: Average Age: ${stats.avgAge}, ` +
              `Personality Types: ${Object.entries(stats.personalityTypes).map(([type, percentage]) => `${type}: ${percentage}`).join(', ')}, ` +
              `Intro/Extro Stats: Introverts ${stats.introExtroStats.Introvert}, Extroverts ${stats.introExtroStats.Extrovert}, ` +
              `Educational Disability: ${stats.educationalDisabilityPercentage}, ` +
              `Physical Disability: ${stats.physicalDisabilityPercentage}, ` +
              `Degrees: ${Object.entries(stats.degrees).map(([degree, percentage]) => `${degree}: ${percentage}`).join(', ')}, ` +
              `Astrology Signs: ${Object.entries(stats.astrologySigns).map(([sign, percentage]) => `${sign}: ${percentage}`).join(', ')}`;
    });
  
  // console.log(groupInfoStrings); // This will log the array of strings, each representing one group's info
  
    
    if (error) {
      throw error;
    }

    req.groupInfoStrings = groupInfoStrings;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}



module.exports = calculateGroupInfo;
