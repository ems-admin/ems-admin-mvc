/**
 * get请求
 * @param url
 * @param params
 * @returns {Promise<unknown>}
 */
function get(url, params) {
    return new Promise((resolve, reject) => {
        axios.get(url, {
            params: params,
            headers: {
                Authorization: sessionStorage.getItem('token')
            }
        }).then(res => {
            resolve(res.data)
        }).catch(err => {
            reject(err.data)
        })
    })
}

/**
 * put请求
 * @param url
 * @param data
 * @returns {Promise<unknown>}
 */
function put(url, data){
    return new Promise((resolve, reject) => {
        axios.put(url, data, {
            headers: {
                Authorization: sessionStorage.getItem('token')
            }
        }).then(res => {
            resolve(res.data)
        }).catch(err => {
            reject(err.data)
        })
    })
}

/**
 * post请求
 * @param url
 * @param data
 * @returns {Promise<unknown>}
 */
function post(url, data) {
    return new Promise((resolve, reject) => {
        axios.post(url, data, {
            headers: {
                Authorization: sessionStorage.getItem('token')
            }
        }).then(res => {
            resolve(res.data)
        }).catch(err => {
            reject(err.data)
        })
    })
}

/**
 * delete请求
 * @param url
 * @param params
 * @returns {Promise<unknown>}
 */
function remove(url, params){
    return new Promise((resolve, reject) => {
        axios.delete(url, {
            params: params
        }, {
            headers: {
              Authorization: sessionStorage.getItem('token')
            }
        }).then(res => {
            resolve(res.data)
        }).catch(err => {
            reject(err.data)
        })
    })
}