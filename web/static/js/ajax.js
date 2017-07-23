function checkStatus(response) {
  if ([200, 201, 202, 204].indexOf(response.status) > -1) {
    return response
  }
  const error = new Error(response.statusText)
  error.response = response
  throw error
}

function parseJson(response) {
  return response.json()
}

function makeRequest(method, url, params) {
  const headers = {
    'accept': 'application/json',
    'content-type': 'application/json'

  };
  const data = { method, headers, credentials: 'same-origin' }
  if (params) {
    data.body = JSON.stringify(params)
  }
  return fetch(url, data).then(checkStatus).then(parseJson)
}

function get(path) {
  return makeRequest('GET', path);
}

function post(path, params) {
  return makeRequest('POST', path, params);
}

function put(path, params) {
  return makeRequest('PUT', path, params);
}

function del(path, params) {
  return makeRequest('DELETE', path, params);
}

export default {
  get: get,
  put: put,
  post: post,
  delete: del
};
