import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost:3000',  // Adjust the IP to match your Express server
  headers: {
    'Content-Type': 'application/json'
  }
});

export const fetchData = async () => {
  try {
    const response = await apiClient.get('/');
    console.log(response.data);
    return response.data;
  } catch (error) {
    console.error('Error fetching data:', error);
    throw error;
  }
};

export default apiClient;
