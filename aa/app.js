//app.js
App({
  // url: "https://www.gongshop.com.cn",
  url: "http://127.0.0.1:8080",
  // 推荐人id
  refereesId:"",
  
  // 权限屏幕得显示开关
  // root: false,
  root: true,
  userData: "",
  onLaunch(res) {
    // 检测是否有新版本，如有下载更新
    const updateManager = wx.getUpdateManager()
    updateManager.onCheckForUpdate(function (res) {
      console.log(res.hasUpdate)
      if (res.hasUpdate) {
        updateManager.onUpdateReady(function () {
          updateManager.applyUpdate()
        })
      }
    })
  },
  /**
  * 登录验证
  */
  isLogin: function () {
    wx.getStorage({
      key: 'userData',
      success:function(e){
        getApp().userData = e.data
      },
      fail: function (e) {
        // console.log(e.data==null)
        wx.redirectTo({
          url: '/pages/login/login',
        })
      }
    })
  },
  //授权函数
  click: function (res, that) {
    // var that = this
    console.log("res1:" + res)
    // wx.getUserInfo({
    //   success: function (res) {
    //     console.log(res)
    //     getApp().root = true
    //     that.setData({
    //       root: getApp().root
    //     })
    //     console.log("APProot:" + getApp().root)
    //     console.log("root:" + that.data.root)
    //   },
    //   fail: function (res) {
    //     console.log(res)
    //   }
    // })
    // getApp().getCode()
  },
  //获得code
  getCode: function(){
    wx.login({
      success(res) {
        if (res.code) {
          // 发起网络请求
          console.log(res.code)
          
        } else {
          console.log('登录失败！' + res.errMsg)
        }
      }
    })
  },
  onShow(res){
    console.log(res)
    if (res.query.refereesId){
      // 如果是通过分享连接进来的，都有推荐人id
      this.refereesId = res.query.refereesId;
      console.log(res.query.refereesId)
      console.log(this.refereesId)
      console.log("get:"+getApp().refereesId)
    }
  }
})
