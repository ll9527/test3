// pages/selleProduct/addSelleProduct.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    // 商品的颜色
    version1: [],
    // 商品的类型
    version: [],
    versionValue:"",
    // 二级目录对象列表
    twoLevelList: [],
    // 二级目录名字
    twoLevelName: [],
    // 二级目录的id
    cid: "",
  },
  /**
 * 生命周期函数--监听页面加载
 */
  onLoad: function (options) {
    var that = this
    getApp().isLogin();
    wx.request({
      url: getApp().url+'/classfiy/selectTwo',
      success: function(res){
        for(var i in res.data){
          that.data.twoLevelName.push(res.data[i].className)
          // console.log(i)
        }
        that.data.twoLevelList = res.data
        that.setData({
          twoLevelName: that.data.twoLevelName
        })
        // console.log(res.data)
        // console.log(that.data.twoLevelName)
      }
    })
  },
  /**
   * picker  value 改变时触发 change 事件
   */
  bindPickerChange(e) {
    var that = this
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      index: e.detail.value,
    })
    // 获取二级目录的id
    that.data.cid = that.data.twoLevelList[e.detail.value].classId
    console.log(that.data.cid)
  },
  /**
   * 增加产品型号
   */
  addVersion: function(e){
    this.data.version.push(e.detail.value)
    this.setData({
      version: this.data.version,
      versionValue: this.data.versionValue
    })
  },
  /**
 * 增加产品颜色或者其他
 */
  addVersion1: function (e) {
    this.data.version1.push(e.detail.value)
    this.setData({
      version1: this.data.version1,
      versionValue: this.data.versionValue
    })
  },
  /**
   * 获取要上传的产品头像图片路径
   */
  seeHeadPhoto: function(){
    var that = this
    wx.chooseImage({
      count:1,
      sizeType: ['original'],
      sourceType: ['album', 'camera'],
      success: function(res){
        // console.log(res.tempFilePaths)
        // console.log(res.tempFiles)
        that.setData({
          headPhoto: res.tempFilePaths
        })
      }
    })
  },
  /**
   * 获取要上传的产品详情图路径
   */
  seeDetailsPhoto: function () {
    var that = this
    wx.chooseImage({
      count: 9,
      sizeType: ['original'],
      sourceType: ['album', 'camera'],
      success: function (res) {
        that.setData({
          detailsPhoto: res.tempFilePaths
        })
        // console.log(res.tempFilePaths)
      }
    })
  },
  /**
   * 上传文件方法
   */
  uploadimg: function (tempFilePaths, productid, isCover){
    // isCover  1代表封面，
    // console.log(tempFilePaths)
    for(var i in tempFilePaths){
      wx.uploadFile({
        url: getApp().url+'/product/upload',
        filePath: tempFilePaths[i],
        header: {
          "content-type": "multipart/form-data"
        },
        name: 'image',
        formData: {
          productid: productid,
          isCover: isCover
        }
      })
    }
  },
  /**
   * form提交
   */
  formSubmit: function(e){
    var that = this
    // console.log(e.detail.value)
    // 如果input框里面的值不为空
    if (e.detail.value.title != "" && e.detail.value.num != "" && e.detail.value.price != ""){
      // if (e.detail.value.freight == ""){
      //   wx.showToast({
      //     title: '请输入运费',
      //     icon: 'loading',
      //     duration: 1000,
      //     mask: true
      //   })
      //   return;
      // }
      if (this.data.version1.length == 0) {
        wx.showToast({
          title: '请增加型号（颜色）',
          icon: 'loading',
          duration: 1000,
          mask: true
        })
        return;
      }
      // 如果商品类型为空，则弹框
      if (this.data.version.length == 0){
        wx.showToast({
          title: '请增加商品型号',
          icon: 'loading',
          duration: 1000,
          mask: true
        })
      }else{
        if (this.data.headPhoto) {
          if (this.data.detailsPhoto) {
            // 如果类型没选择则弹框提示
            if(that.data.cid!=""){
              // 传数据给后台
              wx.request({
                url: getApp().url + '/product/insertP',
                data: {
                  cid: that.data.cid,
                  title: e.detail.value.title,
                  num: e.detail.value.num,
                  price: e.detail.value.price,
                  groupPrice: e.detail.value.groupPrice,
                  versionList: JSON.stringify(that.data.version),
                  versionList1: JSON.stringify(that.data.version1),
                  sellerid: wx.getStorageSync("sellerId"),
                  freight: 0//e.detail.value.freight
                },
                success: function (res) {
                  // console.log(res)
                  if (res.data.info != 1) {
                    // console.log("res.data.info:" + res.data.info)
                    wx.showToast({
                      title: '注册失败',
                      icon: 'loading',
                      duration: 1000,
                      mask: true,
                      success: function (res) {
                        setTimeout(function () {
                          wx.navigateBack({
                            delta: 1
                          })
                        }, 2000)
                      }
                    })
                  } else {
                    // console.log("文件上传")
                    that.uploadimg(that.data.headPhoto, res.data.productid, 1)
                    that.uploadimg(that.data.detailsPhoto, res.data.productid, 0)
                    wx.navigateBack({
                      delta: 1
                    })
                  }
                }
              })
            }else{
              wx.showToast({
                title: '请选择类型',
                icon: 'loading',
                duration: 1000,
                mask: true
              })
            } 
          }else{
            wx.showToast({
              title: '请上传详情图',
              icon: 'loading',
              duration: 1000,
              mask: true
            })
          }
        }else{
          wx.showToast({
            title: '请上传头像',
            icon: 'loading',
            duration: 1000,
            mask: true
          })
        }
      }
    }else{
      wx.showToast({
        title: '输入框不能为空',
        icon: 'loading',
        duration: 1000,
        mask: true
      })
    }
  }
})