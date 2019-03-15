// pages/search/search.js
Page({
  data: {
    url: getApp().url,
    inputShowed: false,
    inputVal: "",
    //历史记录的开关
    searchRecord: true,
    searchBorder: false,
    // showBady: true,
    // 滑动块的index
    current: 0,
    // 导航栏的index
    currentTab: 0,
    // 页面配置
    winWidth: 0,
    winHeight: 0,
    // scroll-into-view
    // listId: "",
    // scrollTop: 0
    // 显示收藏按钮
    showCollect: true,
    //目录分类
    classfiy: [
      "连锁超市", "便利店", "副食店", "食店", "水果店", "服饰其他", "运动户外",
      "日用百货", "母婴", "玩具", "鞋包", "配饰", "美妆日化", "数码家电", "汽车用品", "办公文教", "电工安防", "照明电子", "家装家饰", "家纺家饰", "橡塑化工"
    ]
  },
  //点击输入框触发的方法
  showInput: function () {
    this.setData({
      inputShowed: true,
      searchRecord: false,
      searchBorder: true,
      // showBady: false
    });
  },
  // 点击输入框 取消 触发的方法
  hideInput: function () {
    this.setData({
      inputVal: "",
      inputShowed: false,
      searchRecord: true,
      searchBorder: false,
      // showBady: true
    });
  },
  // 点击输入框 清空 触发
  clearInput: function () {
    this.setData({
      inputVal: "",
      searchRecord: false
    });
  },
  // 输入框输入 触发
  inputTyping: function (e) {
    this.setData({
      inputVal: e.detail.value,
      searchRecord: true
    });
  },
  /** 
   * 点击tab切换 
   */
  swichNav: function (e) {
    var cur = e.target.dataset.current;
    var that = this;
    this.setData({
      navScrollLeft: (cur - 2) * 85
    })
    if (this.data.currentTab === cur) {
      return false;
    } else {
      that.setData({
        currentTab: e.target.dataset.current
      })
    }
  },
  onShow(res) {
    var that = this;
    console.log(that.data.root);
    console.log(getApp().root)
    that.setData({
      root: getApp().root
    })
    console.log(that.data.root);
    console.log(getApp().root)
    //查热门商品
    wx.request({
      url: getApp().url + '/seller/selectAllSeller',
      // data: {
      //   sellerClass: "热门"
      // },
      success: function (res) {
        console.log(res)
        that.setData({
          hotList: res.data
        })
        console.log(that.data.hotList)
      }
    })
  },
  // 授权函数
  click: function (res) {
    getApp().click(res, this)
  },
  /**
   * 加载后运行
   */
  onLoad: function (e) {
    var that = this;
    // 获取系统信息     
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          winWidth: res.windowWidth,
          winHeight: res.windowHeight
        });
        console.log(res.windowHeight);
      }
    });

    // wx.request({
    //   url: getApp().url + '/seller/selectSellerClass',
    //   data: {
    //     sellerClass: "连锁超市"
    //   },
    //   success: function (res) {
    //     console.log(res)
    //     that.setData({
    //       lianSuoList: res.data
    //     })
    //     console.log(that.data.lianSuoList)
    //   }
    // })
    // wx.request({
    //   url: getApp().url + '/seller/selectSellerClass',
    //   data: {
    //     sellerClass: "便利店"
    //   },
    //   success: function (res) {
    //     console.log(res)
    //     that.setData({
    //       bianLiList: res.data
    //     })
    //     console.log(that.data.bianLiList)
    //   }
    // })
    // wx.request({
    //   url: getApp().url + '/seller/selectSellerClass',
    //   data: {
    //     sellerClass: "副食店"
    //   },
    //   success: function (res) {
    //     console.log(res)
    //     that.setData({
    //       fuChiList: res.data
    //     })
    //     console.log(that.data.fuChiList)
    //   }
    // })
    // wx.request({
    //   url: getApp().url + '/seller/selectSellerClass',
    //   data: {
    //     sellerClass: "食店"
    //   },
    //   success: function (res) {
    //     console.log(res)
    //     that.setData({
    //       shiList: res.data
    //     })
    //     console.log(that.data.shiList)
    //   }
    // })
    // wx.request({
    //   url: getApp().url + '/seller/selectSellerClass',
    //   data: {
    //     sellerClass: "水果店"
    //   },
    //   success: function (res) {
    //     console.log(res)
    //     that.setData({
    //       shuiGuoList: res.data
    //     })
    //     console.log(that.data.shuiGuoList)
    //   }
    // })
    // wx.request({
    //   url: getApp().url + '/seller/selectSellerClass',
    //   data: {
    //     sellerClass: "服饰其他"
    //   },
    //   success: function (res) {
    //     console.log(res)
    //     that.setData({
    //       fuShiList: res.data
    //     })
    //     console.log(that.data.fuShiList)
    //   }
    // })
  },
  // 点击搜索后执行
  search: function (res) {
    var that = this
    console.log(res.detail)
    wx.navigateTo({
      url: '/pages/searchItems/search2search?body=' + res.detail.value,
      // success: function(res){
      //   that.setData({
      //     inputShowed: false
      //   })
      // }
    })
  },
  // 点击收藏
  switchCollect:function(e){
    if(this.data.showCollect){ 
      this.setData({
        showCollect:false,
      })
    } else{
      this.setData({
        showCollect: true,
      })
    }
  },
  /**
   * 用商户类型名字查询该类型所有商户
   */
  selectProByClass(sellerClass, that){
    wx.request({
      url: getApp().url + '/seller/selectSellerClass',
      data: {
        sellerClass: sellerClass
      },
      success: function (res) {
        console.log(res)
        that.setData({
          sellerProList: res.data
        })
        console.log(that.data.sellerProList)
      }
    })
  },
  /** 
  * 滑动切换tab 
  */
  bindChange: function (e) {
    var cur = e.detail.current;
    var that = this;
    that.setData({
      // currentTab: e.detail.current,
      current: e.detail.current,
      navScrollLeft: (cur - 2) * 85
    });
    if (e.detail.current > 0){
      //获取 类型名字
      var sellerClass = that.data.classfiy[e.detail.current - 1]
      that.selectProByClass(sellerClass, that)
    }
  },
})