import React from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import { Animated, View, Text, Pressable, Image, StyleSheet, TextInput, SafeAreaView} from 'react-native';
import { useFonts, Lora_400Regular, Lora_700Bold } from "@expo-google-fonts/lora";
import { useRef, Component, useEffect, useState } from 'react';
import TagSelector from 'react-native-tag-selector';
import tag_styles from './TagStyle';

import RNDateTimePicker from '@react-native-community/datetimepicker';
import supabase from './supabaseClient';
import MBTITags from './MBTITags';

// NO MORE WARNINGS MY BELOVED <3
// THANK YOU MISTER STACK OVERFLOW: https://stackoverflow.com/questions/35309385/how-do-you-hide-the-warnings-in-react-native-ios-simulator
import { LogBox } from 'react-native';
LogBox.ignoreLogs(['Warning: ...']);
LogBox.ignoreAllLogs()



const App = () => {
  this.slidey = useRef(new Animated.Value(-580)).current;
  this.viewy = useRef(new Animated.Value(0)).current;
  
  const [name, onChangeName] = React.useState('');
  const [year, onChangeYear] = React.useState('');
  const [month, onChangeMonth] = React.useState('');
  const [day, onChangeDay] = React.useState('');
  
  tagsMaster =     [
    {id: 'walks', name: 'Walks'},
    {id: 'athletics', name: 'Athletics'},
    {id: 'board_games', name: 'Board Games'},
    {id: 'video_games', name: 'Video Games'},
    {id: 'animals', name: 'Animals'},
    {id: 'nature', name: 'Nature'},
    {id: 'singing', name: 'Singing'},
    {id: 'coding', name: 'Coding'},
    {id: 'art', name: 'Art'},
    {id: 'food', name: 'Food'},
    {id: 'reading', name: 'Reading'},
  ];
  const [tags, changeTags] = React.useState();
  const [pressed, handlePress] = React.useState(false);

  const personalityTags = [
    { id: 'introvert', name: 'Introvert' },
    { id: 'extrovert', name: 'Extrovert' },
    { id: 'undecided', name: 'Undecided' }
  ];
  const [personalityType, setPersonalityType] = useState('');

  const [mbtiTags, setMbtiTags] = useState([
    'ISTJ', 'ISTP', 'ISFJ', 'ISFP',
    'INFJ', 'INFP', 'INTJ', 'INTP',
    'ESTP', 'ESTJ', 'ESFP', 'ESFJ',
    'ENFP', 'ENFJ', 'ENTP', 'ENTJ'
  ]);

  const [ethnicityTags] = useState([
    { id: 'caucasian', name: 'Caucasian' },
    { id: 'african_american', name: 'African American' },
    { id: 'hispanic', name: 'Hispanic' },
    { id: 'asian', name: 'Asian' },
    { id: 'native_american', name: 'Native American' },
    { id: 'middle_eastern', name: 'Middle Eastern' },
    { id: 'pacific_islander', name: 'Pacific Islander' },
    { id: 'mixed_race', name: 'Mixed Race' },
    { id: 'other', name: 'Other' }
  ]);
  const [selectedEthnicity, setSelectedEthnicity] = useState('');

     // Disability Tags
     const [disabilityTags] = useState([
      { id: 'wheelchair_user', name: 'Wheelchair User' },
      { id: 'hearing_impaired', name: 'Hearing Impaired' },
      { id: 'cognitive_disabilities', name: 'Cognitive Disabilities' },
      { id: 'autism_spectrum', name: 'Autism Spectrum' }
  ]);

  const [selectedDisability, setSelectedDisability] = useState('');


  const attendees = [
    'https://i.imgur.com/OVO1P48.jpeg',  
    'https://i.imgur.com/YLZpUuH.jpeg',
    'https://i.imgur.com/tAfEMeW.jpeg',
    'https://i.imgur.com/ktEiIHL.jpeg',
  ];

  // const loadData = async () => {
  //   try {
  //     const data = await fetchData();
  //     console.log('Data received:', data);
  //   } catch (error) {
  //     console.log('Failed to fetch data:', error);
  //   }
  // };
  const [affairs, setAffairs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchAffairs = async () => {
      try {
        const { data, error } = await supabase
          .from('affair') 
          .select('*')   
          .eq('group', 2); // with no user auth, there is no group number
        if (error) {
          throw error;
        }

        setAffairs(data[0]);
        console.log(data); // Log the fetched data
      } catch (error) {
        console.error('error', error.message);
        setError(error.message);
      } finally {
        setLoading(false);
      }
    };

    fetchAffairs();
  }, []); 

  const handleSubmit = async () => {
    const userData = {
      name,
      dob: `${year}-${month}-${day}`  // Assuming the server expects a date string
    };

    console.log("hello")

    try {
      const response = await fetch('http://10.207.188.146:3000/newUserProfile', { // hardcoded IP for now
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(userData),
      });
      console.log("sent!")
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const responseText = await response.text(); // or response.json() if response is expected to be in JSON format
      console.log('Server response:', responseText);
      console.log('Profile submitted successfully!');
    } catch (error) {
      console.error('Failed to submit profile:', error);
      alert('Failed to submit profile.');
    }
  }

  let [fontsLoaded, fontError] = useFonts({
    Lora_400Regular, Lora_700Bold
  });

  if (!fontsLoaded && !fontError) {
    return null;
  }
  // // fetch Data from localhost:3000
  // const fetchData = async () => {
  //   try {
  //     const response = await fetch('http://192.168.137.196:3000');
  //     if (!response.ok) {  // Check if the HTTP status code is 200-299
  //       throw new Error('Network response was not ok');
  //     }
  //     const data = await response.json();
  //     return data;
  //   } catch (error) {
  //     console.error('Failed to fetch data:', error);
  //     throw error;  // Re-throw to handle it in the calling context
  //   }
  // };
  function formatDate(dateString) {
    // const options = { month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit'};
    const options = {weekday: 'long', hour: '2-digit', minute: '2-digit'};
    return new Date(dateString).toLocaleDateString('en-US', options);
}

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: '#dedede'}}>
      <Animated.View style={[styles.card, {opacity: viewy}]}>
        <View style={styles.cardBackground}>
          <Image source={{uri: "https://schuylkillyards.com/sites/default/files/styles/max_1300x1300/public/gallery2020-07/0166-E057.jpg"}} style={[styles.banner, {top: -100}]} resizeMode="cover" blurRadius={3}/>
          <View style={{top: -50}}>
            <Text style={[{textAlign: "center", fontSize: 30}, styles.lora]}>{affairs.event_name}</Text>
            <Text style={[{textAlign: "center", fontSize: 14, marginTop: 8}, styles.lora]}>{affairs.location_name} @ {formatDate(affairs.start_time)}</Text>
            <Text style={[{marginTop: 40, marginLeft: 20, marginRight: 20}, styles.lora]}>{affairs.description}</Text>
          </View>
          <Pressable style={pressed ? styles.button2 : styles.button} onPress={()=>{handlePress( pressed => !pressed);}}>
            <Text style={[styles.loraBold, {color: 'white'}]}>{pressed ? 'All set!' : 'Attend'}</Text>
          </Pressable>
        </View>
      </Animated.View>

      <Animated.View style={[styles.participants, {top: -30}, {opacity: viewy}]}>
        {attendees.map((imageUri, index) => (
          <Image
            key={index}
            source={{ uri: imageUri }}
            style={[styles.profileImage, { marginLeft: (index == 0) ? 0 : -15 }]}
          />
        ))}
        <Text style={[styles.lora]}>
          Basil, Mari and two others are attending
        </Text>
      </Animated.View>

      <Animated.View
        style={[styles.bottomToast, {bottom: slidey}]}
        onTouchStart={e=> this.touchY = e.nativeEvent.pageY}
        onTouchEnd={e => {
          if (this.touchY - e.nativeEvent.pageY > 20) {
            // handle swipe up
            Animated.timing(
              this.slidey,
              {
                toValue: 0,
                duration: 200
              }
            ).start();
            Animated.timing(
              this.viewy,
              {
                toValue: 0,
                duration: 200
              }
            ).start();
          }
          else if (e.nativeEvent.pageY - this.touchY > 20) {
            // handle swipe down (also make sure we rn't in a menu)
            Animated.timing(
              this.slidey,
              {
                toValue: -580,
                duration: 200
              }
            ).start();
            Animated.timing(
              this.viewy,
              {
                toValue: 1,
                duration: 100
              }
            ).start();
          }
        }}
      >
        <Image source={{uri: "https://i.imgur.com/mTVi2qv.jpeg"}} style={[styles.avatar]} resizeMode="cover"/>
        <Text style={[styles.lora, {color: '#fefefe', textAlign: "center", top: 22}]}>Edit your profile &lt;3</Text>
        <SafeAreaView style={[{top: 20}]}>
          <TextInput
            style={[styles.input, styles.lora]}
            onChangeText={onChangeName}
            value={name}
            placeholderTextColor="#b8b8b8" 
            placeholder="Name"
          />
          {/* <Text style={[styles.lora, {color: "#fefefe", marginLeft: 16}]}>Name</Text> */}

          <View style={[{flexDirection:'row', alignItems:'center'}]}>
          <TextInput
            style={[styles.input, styles.lora, styles.ff]}
            onChangeText={onChangeMonth}
            value={month}
            placeholderTextColor="#b8b8b8" 
            placeholder="MM"
            keyboardType="numeric"
            maxLength={2}
          />  
          <TextInput
            style={[styles.input, styles.lora, styles.ff]}
            onChangeText={onChangeDay}
            value={day}
            placeholderTextColor="#b8b8b8" 
            placeholder="DD"
            keyboardType="numeric"
            maxLength={2}
          />  
          <TextInput
            style={[styles.input, styles.lora, styles.ffff]}
            onChangeText={onChangeYear}
            value={year}
            placeholderTextColor="#b8b8b8" 
            placeholder="YYYY"
            keyboardType="numeric"
            maxLength={4}
          />  
          </View>
          {/* <Text style={[styles.lora, {color: "#fefefe", marginLeft: 16, top: -4, marginBottom: 10}]}>Date of Birth</Text> */}
          
          <View
            style={[{color: "#fefefe", marginLeft: 12, marginTop: 5, marginBottom: 10}]}
          >
          <TagSelector
            maxHeight={200}
					  tags={tagsMaster}
					  onChange={changeTags}
            expandCaptions={["", ""]}
            expdandedContainerStyle = {[tag_styles.containerExpanded, styles.lora]}
            containerStyle = {[tag_styles.container, styles.lora]}
            selectedTagStyle = {[tag_styles.tagSelected, styles.lora]}
            tagStyle = {[tag_styles.tag, styles.lora]}
            separatorStyle = {[tag_styles.separator, styles.lora]}
            expandBtnStyle = {[tag_styles.btnStyle, styles.lora]}
            expandTextStyle = {[tag_styles.btnText, styles.lora]}
            tagstyl
            // style this but yeah its donie
            />
          </View>
          {/* <Text style={[styles.lora, {color: "#fefefe", marginLeft: 16, marginBottom: 10, top: 10}]}>Interests</Text> */}

          <View
            style={[{color: "#fefefe", marginLeft: 12, marginTop: 5, marginBottom: 12}]}
          >
          <TagSelector
            maxHeight={200}
					  tags={personalityTags}
					  onChange={setPersonalityType}
            expandCaptions={["", ""]}
            expdandedContainerStyle = {[tag_styles.containerExpanded, styles.lora]}
            containerStyle = {[tag_styles.container, styles.lora]}
            selectedTagStyle = {[tag_styles.tagSelected, styles.lora]}
            tagStyle = {[tag_styles.tag, styles.lora]}
            separatorStyle = {[tag_styles.separator, styles.lora]}
            expandBtnStyle = {[tag_styles.btnStyle, styles.lora]}
            expandTextStyle = {[tag_styles.btnText, styles.lora]}
            tagstyl
            // style this but yeah its donie
            />
          </View>

          <View
            style={[{color: "#fefefe", marginLeft: 12, marginTop: 5, marginBottom: 12}]}
          >
          <TagSelector
            maxHeight={200}
					  tags={disabilityTags}
					  onChange={setSelectedDisability}
            expandCaptions={["", ""]}
            expdandedContainerStyle = {[tag_styles.containerExpanded, styles.lora]}
            containerStyle = {[tag_styles.container, styles.lora]}
            selectedTagStyle = {[tag_styles.tagSelected, styles.lora]}
            tagStyle = {[tag_styles.tag, styles.lora]}
            separatorStyle = {[tag_styles.separator, styles.lora]}
            expandBtnStyle = {[tag_styles.btnStyle, styles.lora]}
            expandTextStyle = {[tag_styles.btnText, styles.lora]}
            tagstyl
            // style this but yeah its donie
            />
          </View>

          <View style={{top: 10}}>
            <MBTITags mbtiTags={mbtiTags}/>
          </View>

          <Pressable onPress={handleSubmit} style={[{ marginTop: 25 }, styles.button]}>
            <Text style={[{color: 'white'}, styles.text]}>Submit</Text>
          </Pressable>

        </SafeAreaView>
      </Animated.View>

    </View>
  );
};



const styles = StyleSheet.create({
  ff: {
    width: 60,
  },
  ffff: {
    width: 120,
  },
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
    borderColor: "#dedede",
    color: "#dedede",
    borderRadius: 2,
    backgroundColor: "rgba(0.1, 0.1, 0.1, 0.15)",
    borderTopColor: "rgba(0, 0, 0, 0)",
    borderRightColor: "rgba(0, 0, 0, 0)",
    borderLeftColor: "rgba(0, 0, 0, 0)",
    fontSize: 18,
  },
  avatar: {
    width: 75,
    height: 75,
    marginLeft: 'auto',
    marginRight: 'auto',
    top: -25,
    borderRadius: 18,
  },
  bottomToast: {
    backgroundColor: "#212121",
    width: "100%",
    height: 680,
    position: "absolute",
    bottom: 0,
    borderTopRightRadius: 20,
    borderTopLeftRadius: 20,
    elevation: 3,  
  },
  lora: {
    fontFamily: "Lora_400Regular"
  },
  loraBold: {
    fontFamily: "Lora_700Bold"
  },
  button: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    marginLeft: 40,
    marginRight: 40,
    borderRadius: 4,
    elevation: 3,
    backgroundColor: '#E85380',
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 2,
    shadowOffset: {width:2,height:4},
  },
  button2: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    marginLeft: 40,
    marginRight: 40,
    borderRadius: 4,
    elevation: 3,
    backgroundColor: '#b08492',
    opacity: 0.5,
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 2,
    shadowOffset: {width:2,height:4},
  },
  card: {
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 4,
    shadowOffset: {width:0,height:4},
    top: -50,
  },
  cardBackground: {
    width: 307,
    height: 498,
    flexShrink: 0,
    borderRadius: 30,
    backgroundColor: 'rgba(255, 255, 255, 1)',
    overflow: 'hidden'
  },
  banner: {
    width: 307,
    height: 207,
  },
  participants: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    rowGap: 7,
    columnGap: 7,
  },
  profileImage: {
    width: 20,
    height: 20, 
    borderRadius: 20
  }
})

export default App;
