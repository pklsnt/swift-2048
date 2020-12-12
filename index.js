import React from "react";
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Button,
  NativeModules,
} from "react-native";

class HighScores extends React.Component {
  _close() {
    console.log("you click close...");
  }

  render() {
    var contents = this.props["scores"].map((score) => (
      <Text key={score.name}>
        {score.name}:{score.value}
        {"\n"}
      </Text>
    ));
    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>2048 High Scores!</Text>
        <Text style={styles.scores}>{contents}</Text>
        <Button
          onPress={() => NativeModules.ReactNativeModalBridge.closeModal()}
          title="Close"
          color="#841584"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#FFFFFF",
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: "center",
    margin: 10,
  },
  scores: {
    textAlign: "center",
    color: "#333333",
    marginBottom: 5,
  },
});

// Module name
AppRegistry.registerComponent("ReactNativeModal", () => HighScores);
