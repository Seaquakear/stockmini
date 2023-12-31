<template>
  <div class="form-container">
    <el-row :gutter="20" style="text-align: center;margin-top: 50px;">
      <div>
        <!-- 图片绑定 -->
        <img :src="currentImage" alt="Dynamic Image">
      </div>
      <el-input v-model="inputCode" placeholder="请输入代码" style="width: 200px;margin-top: 50px;"></el-input>
      <el-input v-model="inputNum" placeholder="请输入数量" style="width: 200px;margin-top: 50px;"></el-input>
      <!-- 添加按钮 -->
      <el-button type="primary" @click="handleInputChange">提交</el-button>
    </el-row>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'loginPage2',
  data() {
    return {
      inputCode: '300502',
      inputNum: '1000',
      isLogin: true, // 切换表单显示
      formData: {
        email: '',
        password: '',
        confirmPassword: ''
      },
      allStockInfo: [],    // 用来收集所有stockInfo的数组
      currentImage: require('@/assets/hjd.jpg'),
    };
  },
  created() {
    // this.handleInputChange();
  },

  methods: {
    handleInputChange() {
      let tempCode = "";
      if (this.inputCode.startsWith("60")) {
        tempCode = "sh" + this.inputCode;
      }
      if (this.inputCode.startsWith("sz") || this.inputCode.startsWith("sh")) {
        tempCode = this.inputCode;
      }
      if (this.inputCode.startsWith("30") || this.inputCode.startsWith("00")) {
        tempCode = "sz" + this.inputCode;
      }
      axios.get("https://qt.gtimg.cn/q=" + tempCode)
        .then(response => {
          const data = response.data;
          const details = data.split('~');
          var zhandiejia = details[31];
          var result = this.inputNum * zhandiejia;
          console.log("得数：" + result);
          this.currentImage = require('@/assets/hjd.jpg');
          if (result > 1000) {
            this.currentImage = require('@/assets/morethan1000.jpg');
          } else if (result > 500) {
            this.currentImage = require('@/assets/morethan500.jpg');
          } else if (result < -1000) {
            this.currentImage = require('@/assets/lessthan1000.jpg');
          } else if (result < -500) {
            this.currentImage = require('@/assets/lessthan500.gif');
          }
        })
    },


  }
};
</script>

<style>
.form-container {
  /* display: flex;
  justify-content: center; */
  align-items: center;
  min-height: 50vh;
  background-color: #ffffff;
}
</style>
