<template>
  <div class="form-container">
    <el-row :gutter="20" style="text-align: center;">
      <el-input v-model="inputData" placeholder="请输入内容，用逗号分隔" style="width: 500px;margin-top: 50px;"></el-input>
      <!-- 添加按钮 -->
      <el-button type="primary" @click="handleInputChange">提交</el-button>
    </el-row>
    <el-row :gutter="20" style="margin-top: 50px;display: flex;flex-wrap: wrap;">
      <el-col :span="3.5" v-for="(item, index) in allStockInfo" :key="index">
        <el-card class="pricing-card popular" style="width: 350px;">
          <div class="card-header">
            <div class="price">{{ item.name }}</div>
            <div class="popular-label">涨跌率: {{ item.zahngdiefu }}%</div>
          </div>
          <el-divider></el-divider>
          <div class="card-content">
            <p><i class="el-icon-check"></i>代码: {{ item.code }}</p>
            <p><i class="el-icon-check"></i>昨收: {{ item.zuoshou }}</p>
            <p><i class="el-icon-check"></i>今开: {{ item.jinkai }}</p>
            <p><i class="el-icon-check"></i>当前价格: {{ item.currentPrice }}</p>
            <p><i class="el-icon-check"></i>成交量: {{ item.chengjiaoliang }}</p>
            <p><i class="el-icon-check"></i>外盘: {{ item.waipan }}</p>
            <p><i class="el-icon-check"></i>内盘: {{ item.neipan }}</p>
            <p><i class="el-icon-check"></i>涨跌: {{ item.zhangdie }}</p>
            <p><i class="el-icon-check"></i>最高: {{ item.zuigao }}</p>
            <p><i class="el-icon-check"></i>最低: {{ item.zuidi }}</p>
            <p><i class="el-icon-check"></i>换手率: {{ item.huanshoulv }}</p>
            <p><i class="el-icon-check"></i>时间: {{ item.shijian }}</p>
          </div>
        </el-card>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'loginPage',
  data() {
    return {
      inputData: '600941,300502,002594', // 绑定输入框的数据
      isLogin: true, // 切换表单显示
      formData: {
        email: '',
        password: '',
        confirmPassword: ''
      },
      allStockInfo: [], // 用来收集所有stockInfo的数组
    };
  },
  created() {
    this.handleInputChange();
  },

  methods: {

    handleInputChange() {
      // 处理数据，例如分割字符串
      this.allStockInfo = [];
      let dataArray = this.inputData.split(',');
      for (let item of dataArray) {
        let tempCode = "";
        if (item.startsWith("60")) {
          tempCode = "sh" + item;
        }
        if (item.startsWith("sz") || item.startsWith("sh")) {
          tempCode = item;
        }
        if (item.startsWith("30") || item.startsWith("00")) {
          tempCode = "sz" + item;
        }
        axios.get("https://qt.gtimg.cn/q=" + tempCode)
          .then(response => {
            const data = response.data;
            const details = data.split('~');
            var stockInfo = [];
            // 根据接口返回的数据结构来解析数据
            stockInfo = {
              name: details[1],
              code: details[2],
              currentPrice: details[3],
              zuoshou: details[4],
              jinkai: details[5],
              chengjiaoliang: details[6],
              neipan: details[7],
              waipan: details[8],
              zhangdie: details[31],
              zahngdiefu: details[32],
              zuigao: details[33],
              zuidi: details[34],
              huanshoulv: details[38],
              shijian: details[30],
            };
            this.allStockInfo.push(stockInfo); // 将数据添加到集合中
          })
      }
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

.pricing-card {
  text-align: center;
  border: none;
  transition: transform 0.3s;
}

.pricing-card:hover {
  transform: translateY(-10px);
}


.card-header {
  font-size: 20px;
  font-weight: bold;
  color: #333;
  position: relative;
}

.price {
  font-size: 24px;
  margin: 10px 0;
}

.card-content {
  margin-top: 20px;
}

.popular .card-header {
  background-color: #7D4CDB;
  color: #fff;
  padding: 10px;
  border-radius: 6px;
}

.popular-label {
  position: absolute;
  top: -10px;
  right: -10px;
  background: #c21d38;
  color: #fff;
  padding: 5px 10px;
  font-size: 14px;
  border-radius: 14px;
}

.el-icon-check {
  color: #ac4caf;
}
</style>
