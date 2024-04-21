import React from 'react';
import { View, Text, StyleSheet, Dimensions } from 'react-native';
import Carousel from 'react-native-snap-carousel';

const MBTITags = ({ mbtiTags }) => {
  const renderItem = ({ item, index }) => {
    return (
      <View style={styles.slide}>
        <Text style={styles.title}>{item}</Text>
      </View>
    );
  };

  return (
    <Carousel
      data={mbtiTags}
      renderItem={renderItem}
      sliderWidth={Dimensions.get('window').width}
      itemWidth={300}
      layout="default"
      loop={true}
    />
  );
};

const styles = StyleSheet.create({
  slide: {
    height: 60,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#E85380',
    borderRadius: 8,
    shadowColor: '#000',
    shadowRadius: 6,
    shadowOpacity: 0.3,
    shadowOffset: { width: 0, height: 2 },
  },
  title: {
    fontSize: 16,
    fontWeight: '500',
    letterSpacing: 5,
    color: 'white',
  }
});

export default MBTITags;
