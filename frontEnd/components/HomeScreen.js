import React, { useEffect } from 'react';
import { View, Text, Button, Image, StyleSheet} from 'react-native';
// import { fetchData } from './api/apiClient';


const attendees = [
  'https://i.imgur.com/OVO1P48.jpeg',  
  'https://i.imgur.com/YLZpUuH.jpeg',
  'https://i.imgur.com/tAfEMeW.jpeg',
  'https://i.imgur.com/ktEiIHL.jpeg',
];

const HomeScreen = () => {
  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      const data = await fetchData();
      console.log('Data received:', data);
    } catch (error) {
      console.log('Failed to fetch data:', error);
    }
  };

  // fetch Data from localhost:3000
  const fetchData = async () => {
    try {
      const response = await fetch('http://192.168.137.196:3000');
      if (!response.ok) {  // Check if the HTTP status code is 200-299
        throw new Error('Network response was not ok');
      }
      const data = await response.json();
      return data;
    } catch (error) {
      console.error('Failed to fetch data:', error);
      throw error;  // Re-throw to handle it in the calling context
    }
  };
  
  
      {/* <Text>Welcome to the Home Screen!a</Text>
      <Button title="Load Data" onPress={loadData} /> */}
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: '#dedede'}}>
      <View style={styles.card}>
        <View style={styles.cardBackground}>
          <Image source={{uri: "https://schuylkillyards.com/sites/default/files/styles/max_1300x1300/public/gallery2020-07/0166-E057.jpg"}} style={styles.banner} resizeMode="cover" blurRadius={3}/>
          <Text>Event Name</Text>
          <Text>129 S 30th St @ 12:00 PM </Text>
          <Text>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nec dui nunc mattis enim ut. Enim ut sem viverra aliquet eget sit amet tellus. Non odio euismod lacinia at quis. Dictum non consectetur a erat nam at.</Text>
          <Button title='Attend'></Button>
        </View>
      </View>

      <View style={styles.participants}>
        {attendees.map((imageUri, index) => (
          <Image
            key={index}
            source={{ uri: imageUri }}
            style={[styles.profileImage, { marginLeft: (index == 0) ? 0 : -15 }]}
          />
        ))}
        <Text>
          Basil, Mari, and 2 others are attending
        </Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 4,
    shadowOffset: {width:0,height:4},
    top: -30,
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
    top: -100,
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

export default HomeScreen;
