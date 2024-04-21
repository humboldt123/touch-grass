import React from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import { Animated, View, Text, Pressable, Image, StyleSheet, TextInput, SafeAreaView} from 'react-native';
import { useFonts, Lora_400Regular, Lora_700Bold } from "@expo-google-fonts/lora";
import { useRef } from 'react';


import RNDateTimePicker from '@react-native-community/datetimepicker';

// NO MORE WARNINGS MY BELOVED <3
// THANK YOU MISTER STACK OVERFLOW: https://stackoverflow.com/questions/35309385/how-do-you-hide-the-warnings-in-react-native-ios-simulator
import { LogBox } from 'react-native';
LogBox.ignoreLogs(['Warning: ...']);
LogBox.ignoreAllLogs()


const App = () => {
  this.slidey = useRef(new Animated.Value(-580)).current;
  this.viewy = useRef(new Animated.Value(1)).current;
  
  const [name, onChangeName] = React.useState('');
  const [year, onChangeYear] = React.useState('');
  const [month, onChangeMonth] = React.useState('');
  const [day, onChangeDay] = React.useState('');

  const attendees = [
    'https://i.imgur.com/OVO1P48.jpeg',  
    'https://i.imgur.com/YLZpUuH.jpeg',
    'https://i.imgur.com/tAfEMeW.jpeg',
    'https://i.imgur.com/ktEiIHL.jpeg',
  ];
  const loadData = async () => {
    try {
      const data = await fetchData();
      console.log('Data received:', data);
    } catch (error) {
      console.log('Failed to fetch data:', error);
    }
  };

  let [fontsLoaded, fontError] = useFonts({
    Lora_400Regular, Lora_700Bold
  });

  if (!fontsLoaded && !fontError) {
    return null;
  }
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

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: '#dedede'}}>
      <Animated.View style={[styles.card, {opacity: viewy}]}>
        <View style={styles.cardBackground}>
          <Image source={{uri: "https://schuylkillyards.com/sites/default/files/styles/max_1300x1300/public/gallery2020-07/0166-E057.jpg"}} style={[styles.banner, {top: -100}]} resizeMode="cover" blurRadius={3}/>
          <View style={{top: -50}}>
            <Text style={[{textAlign: "center", fontSize: 30}, styles.lora]}>Event Name</Text>
            <Text style={[{textAlign: "center", fontSize: 14, marginTop: 8}, styles.lora]}>129 S 30th St @ 12:00 PM </Text>
            <Text style={[{marginTop: 40, marginLeft: 20, marginRight: 20}, styles.lora]}>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nec dui nunc mattis enim ut. Enim ut sem viverra aliquet eget sit amet tellus. Non odio euismod lacinia at quis. Dictum non consectetur a erat nam at.</Text>
          </View>
          <Pressable style={styles.button}>
            <Text style={[styles.loraBold, {color: 'white'}]}>Attend</Text>
          </Pressable>
        </View>
      </Animated.View>

      <View style={[styles.participants, {top: -30}]}>
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
      </View>

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
                duration: 500
              }
            ).start();
            Animated.timing(
              this.viewy,
              {
                toValue: 0,
                duration: 500
              }
            ).start();
          }
          else if (e.nativeEvent.pageY - this.touchY > 20) {
            // handle swipe down (also make sure we rn't in a menu)
            Animated.timing(
              this.slidey,
              {
                toValue: -580,
                duration: 500
              }
            ).start();
            Animated.timing(
              this.viewy,
              {
                toValue: 1,
                duration: 400
              }
            ).start();
          }
        }}
      >
        <Image source={{uri: "https://i.imgur.com/mTVi2qv.jpeg"}} style={[styles.avatar]} resizeMode="cover"/>
        <Text style={[styles.lora, {color: '#fefefe', top: 25, textAlign: "center"}]}>Edit your profile &lt;3</Text>
        <SafeAreaView style={[{top: 50}]}>
          <TextInput
            style={[styles.input, styles.lora]}
            onChangeText={onChangeName}
            value={name}
            placeholderTextColor="#b8b8b8" 
            placeholder="Name"
          />

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
