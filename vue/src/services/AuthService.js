import axios from 'axios';

export default {

  login(user) {
    return axios.post('/login', user)
  },

  register(user) {
    return axios.post('/register', user)
  },
  /**
   * @param {email, zip} user 
   */
  updateAccount(user) {
    return axios.put('/user', user)
  },

  getUserInfo() {
    return axios.get('/user')
  }
}
