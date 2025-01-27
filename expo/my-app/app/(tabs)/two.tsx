import { StyleSheet } from 'react-native';
import React from "react";

import EditScreenInfo from '@/components/EditScreenInfo';
import { Text, View } from '@/components/Themed';

import axios from 'axios';
// const axios = require('axios');
const testing = ('test');
const pong = axios.get('http://10.0.0.100:8004/ping/')
  .then(function (response) {
  // handle success
  console.log(response.status);
  console.log(response.statusText);
  console.log(response.headers);
  console.log(response.config);
  console.log(response.data);
})
  .catch(function (error) {
  // handle error
  console.log(error);
  })
  .finally(function () {
  // always executed
});


export default function TabTwoScreen() {

  const [post, setPost] = React.useState(null);

  React.useEffect(() => {
    axios.get('http://10.0.0.100:8004/ping/').then((response) => {
      setPost(response.data);
      console.log(response.data);
      console.log("post", post);
    });
  }, []);  

  if (!post) return null;

  console.log("Hello World");

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Tab Two {testing} {JSON.stringify(post)}</Text>
      <View style={styles.separator} lightColor="#eee" darkColor="rgba(255,255,255,0.1)" />
      <EditScreenInfo path="app/(tabs)/two.tsx" />

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
  },
  separator: {
    marginVertical: 30,
    height: 1,
    width: '80%',
  },
});
