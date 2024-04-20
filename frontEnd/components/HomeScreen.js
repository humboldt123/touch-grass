import React, { useEffect } from 'react';
import { View, Text, Button } from 'react-native';
// import { fetchData } from './api/apiClient';

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
  
  

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>Welcome to the Home Screen!</Text>
      <Button title="Load Data" onPress={loadData} />
    </View>
  );
};

export default HomeScreen;
