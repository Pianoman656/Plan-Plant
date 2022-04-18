import axios from 'axios';

export default {

  login(user) {
    return axios.post('/login', user)
  },

  register(user) {
    return axios.post('/register', user)
  },

  updateAccount(id, user) {
    return axios.put(`/account/${id}`, user)
  },
}
