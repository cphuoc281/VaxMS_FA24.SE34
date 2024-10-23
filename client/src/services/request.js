
var firstUrl = 'http://localhost:8080'
async function uploadSingleFile(filePath) {
    const formData = new FormData()
    formData.append("file", filePath.files[0])
    var urlUpload = firstUrl+'/api/public/upload-file';
    const res = await fetch(urlUpload, {
        method: 'POST',
        body: formData
    });
    if (res.status < 300) {
        var linkImage = await res.text();
        return linkImage;
    }
    else{
        return null;
    }
}

async function uploadMultipleFile(listFile) {
    const formData = new FormData()
    for (var i = 0; i < listFile.length; i++) {
        formData.append("file", listFile[i])
    }
    var urlUpload = 'http://localhost:8080/api/public/upload-multiple-file';
    const res = await fetch(urlUpload, {
        method: 'POST',
        body: formData
    });
    if (res.status < 300) {
        return await res.json();
    } else {
        return [];
    }
}

async function getMethod(url) {
    const token = localStorage.getItem("token");
    if (url.includes(firstUrl) == false) {
      url = firstUrl + url;
    }
    let headers = new Headers();
    if (token) {
      headers.append('Authorization', `Bearer ${token}`);
    }
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });
    return response;
  }
  
  async function postMethod(url) {
    const token = localStorage.getItem("token");
    if (url.includes(firstUrl) == false) {
      url = firstUrl + url;
    }
    let headers = new Headers();
    if (token) {
      headers.append('Authorization', `Bearer ${token}`);
    }
    const response = await fetch(url, {
      method: 'POST',
      headers: headers
    });
    return response;
  }
  

async function postMethodPayload(url, payload) {
    const token = localStorage.getItem("token");
    console.log('Token sử dụng:', token); // Log token để kiểm tra
    if (url.includes(firstUrl) == false) {
      url = firstUrl + url;
    }
    try {
      let headers = new Headers({
        'Content-Type': 'application/json'
      });
      if (token) {
        headers.append('Authorization', `Bearer ${token}`);
      }
      const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
      });
      return response;
    } catch (error) {
      console.error('Lỗi khi gọi API:', error); // Log lỗi để debug
      throw error;
    }
  }
  
  

async function deleteMethod(url) {
    const token = localStorage.getItem("token");
    if (url.includes(firstUrl) == false) {
        url = firstUrl + url;
    }
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    return response;
}


export {getMethod,postMethod, uploadSingleFile,uploadMultipleFile,postMethodPayload,deleteMethod}