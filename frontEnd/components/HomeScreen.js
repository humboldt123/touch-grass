import React, { useEffect } from 'react';
import { View, Text, Button } from 'react-native';
import { fetchData } from './api/apiClient';

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

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>Welcome to the Home Screen!</Text>
      <Button title="Load Data" onPress={loadData} />
    </View>
  );
};

export default HomeScreen;
