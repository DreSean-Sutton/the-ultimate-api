function handleValidity (arr) {
  for (let i = 0; i < arr.length; i++) {
    if(!arr[i]) {
      return false
    }
  }
  return true
}

module.exports = handleValidity
