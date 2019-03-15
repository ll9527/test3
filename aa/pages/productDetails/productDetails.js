// pages/productDetails/productDetails.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 商品得型号
    classify:[],
    // 商品的型号（颜色）
    classify1: [],
    // 收藏显示开关
    collection: false,
    // 用户选择商品的型号(颜色)index
    radioId1:"0",
    // 用户选择商品得数量
    count: 0,
    // 商品的库存
    num: 0,
    // 商品id
    productid:""
  },
  /**
   * 点击右符号 增 数量
   */
  add: function (e) {
    if (this.data.count < this.data.num) {
      this.data.count += 1;
      this.setData({
        count: this.data.count
      })
    } else {
      // 如果件数大于库存数，则件数等于库存数
      this.data.count = this.data.num;
      this.setData({
        count: this.data.count
      })
    }
    
  },
  /**
   * 点击右符号 减 数量
   */
  reduce: function (e) {
    // 如果件数大于0，可以减件数
    if (this.data.count > 0) {
      this.data.count -= 1;
      this.setData({
        count: this.data.count
      })
    } else {
      // 件数小于0，件数等于0
      this.data.count = 0;
      this.setData({
        count: this.data.count
      })
    }
  }, 
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(res){
    var that = this;
    getApp().isLogin();
    console.log(res)
    that.data.productid = res.productid;
    wx.request({
      url: getApp().url + '/seller/addVisitNum',
      data: {
        productid: res.productid
      }
    })
    wx.request({
      url: getApp().url +'/product/selectDetail',
      data: {
        productid:res.productid
      },
      success: function(res) {
        console.log(res)
        that.setData({
          productDetail: res.data,
          num: res.data.productList[0].num,
          classify: res.data.productVersion,
          classify1: res.data.productVersion1,
          classify1: res.data.productVersion1,
          url: getApp().url+"/image/"
        }) 
        console.log(that.data.classify)      
      }
    })
    wx.getStorage({
      key: 'userData',
      success: function(e) {
        wx.request({
          url: getApp().url + '/user/checkIsCollect',
          data: {
            productid: res.productid,
            userid: e.data.userId
          },
          success: function(e){
            console.log("checkIsCollect："+e.data)
            // 1代表已经收藏
            if(e.data == 1){
              that.setData({
                collection: true,
              })  
            }else{
              that.setData({
                collection: false
              })
            }
          }
        })
      },
      fail: function(e){
        that.setData({
          collection: false
        })
      }
    })
    
  },
  /**
   * 选择商品分类
   */
  radioChange:function(e){
    console.log(e.detail.value)
    this.setData({
      radioId: e.detail.value
    });
  },
  /**
 * 选择商品分类
 */
  radioChange1: function (e) {
    console.log(e.detail.value)
    this.setData({
      radioId1: e.detail.value
    });
  },
  /**
   * 点击收藏
   */
  onCollection: function(e){
    var that = this
    wx.getStorage({
      key: 'userData',
      success: function (e) {
        if (that.data.collection==true){
          // 取消收藏
          wx.request({
            url: getApp().url +'/user/collectOperation',
            data: {
              productid: that.data.productid,
              userid: e.data.userId,
              operation: 0
            },
            success: function(e){
              that.setData({
                collection: false
              })
            }
          })
        }else{
          // 收藏
          wx.request({
            url: getApp().url + '/user/collectOperation',
            data: {
              productid: that.data.productid,
              userid: e.data.userId,
              operation: 1
            },
            success: function (e) {
              that.setData({
                collection: true
              })
              console.log("收藏操作返回：" + e.data)
            }
          })
        }
      },
      fail: function (e) {
        that.setData({
          collection: false
        })
      }
    })
  },
  /**
   * 跳转开团页面
   */
  goGroup: function(e){
    // wx.navigateTo({
    //   url: '/pages/goGroup/goGroup'
    // })
  },
  /**
   * 跳转订单页面
   */
  goPay(res){
    var that = this;
    if (this.data.count <= 0){
      wx.showToast({
        title: '请选择数量',
        icon: 'loading',
        duration: 1000,
        mask: true
      })
      return;
    }
    if( !this.data.radioId){
      wx.showToast({
        title: '请选择型号',
        icon: 'loading',
        duration: 1000,
        mask: true
      })
      return;
    }
    console.log(this.data.radioId)
    if (!this.data.radioId1) {
      wx.showToast({
        title: '请选择型号',
        icon: 'loading',
        duration: 1000,
        mask: true
      })
      return;
    }
    wx.getStorage({
      key: 'userid',
      success: function(res) {
        console.log(res)
        console.log(that.data.classify)
        console.log(that.data.classify[that.data.radioId].versionName)
        console.log(that.data.productDetail.productList)
        var version1Name
        if (that.data.classify1.length > 0){
          version1Name = that.data.classify1[that.data.radioId1].version1Name
        }else{
          version1Name = ""
        }
        wx.navigateTo({
          url: '/pages/order/order?userid=' + res.data + "&versionName=" + that.data.classify[that.data.radioId].versionName
            + "&version1Name=" + version1Name  + "&count=" + that.data.count 
            + "&product=" + JSON.stringify(that.data.productDetail.productList)
        })
      },
      fail(res){
        wx.navigateTo({
          url: '/pages/login/login'
        })
      }
    })
  },
  /**
   * 跳转店铺首页
   */
  goStore: function(e){
    // wx.navigateTo({
    //   url: '/pages/storeDetails/storeDetails'
    // })
  }
})