import { StyleSheet } from "react-native";

const tag_styles = StyleSheet.create({
    btnText: {
        fontSize: 12,
        textAlign: 'right',
        padding: 0,
    },
    btnStyle: {
        height: 25,
        justifyContent: 'flex-start',
        alignSelf: 'flex-end',
    },
    container: {
        flexDirection: 'row',
        flexWrap: 'wrap',
        overflow: 'hidden',
    },
    containerExpanded: {
        flexDirection: 'row',
        flexWrap: 'wrap',
    },
    tag: {
        alignSelf: 'center',
        fontSize: 12,
        paddingBottom: 8,
        paddingTop: 8,
        paddingLeft: 16,
        paddingRight: 16,
        height: 32,
        margin: 2,
        backgroundColor: '#121212',
        color: "#fefefe"
    },
    tagSelected: {
        alignSelf: 'center',
        fontSize: 12,
        paddingBottom: 8,
        paddingTop: 8,
        paddingLeft: 16,
        paddingRight: 16,
        height: 32,
        margin: 2,
        color: 'white',
        backgroundColor: '#E85380',
    }
})

export default tag_styles;