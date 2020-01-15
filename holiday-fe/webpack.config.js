const path = require('path')
const webpack = require('webpack')
const moment = require('moment')
const autoprefixer = require('autoprefixer')
const CaseSensitivePathsPlugin = require('case-sensitive-paths-webpack-plugin')
const version = require('uuid')()
const GenerateAssetPlugin = require('generate-asset-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const SpeedMeasurePlugin = require("speed-measure-webpack-plugin")
const package = require('./package.json')
const WatchChangedPlugin = require("webpack-watch-changed")

const isProduction = process.env.NODE_ENV === 'production'
const envName = isProduction ? 'production' : 'development'

const isMobile = process.env.MDF_TARGET === 'mobile'
const srcBase = isMobile ? 'mobile' : 'web'

const nowDateStr = moment().format("YYYY-MM-DD HH:mm:ss")


const smp = new SpeedMeasurePlugin()

const scriptPort = process.env.SCRIPT_PORT || 3004;
let localPath = 'localhost';
if (process.env.IP === 'true') {
  //获取本机ip
  const os = require('os');
  const ifaces = os.networkInterfaces();
  const ips = [];
  for (let dev in ifaces) {
    const alias = 0;
    ifaces[dev].forEach(function (details) {
      if (details.family == 'IPv4') {
        //console.log(dev+(alias?':'+alias:''),details.address);
        ips.push(details.address)
        ++alias;
      }
    });
  }

  localPath = ips[1];
}

const origin = [
  path.resolve('node_modules/@mdf'),
  path.resolve('src/mobile'),
  path.resolve('src/web')
];

const cssPath = isProduction ? 'public/stylesheets/[name].min.css' : 'static/styles/ncc-theme/vendor.css'

const publicPath = isProduction ? '/' : `http://${localPath}:${scriptPort}/`
const outputPath = path.join(__dirname, isProduction ? 'static' : './')
const outputFilename = isProduction ? 'public/javascripts/[name].min.js' : 'static/javascripts/[name].js'
const chunkFilename = isProduction ? `public/javascripts/[name].bundle.js?_=1.0-SNAPSHOT` : undefined
const entry = isMobile ? {
  'mobile.index': ['./src/mobile/client']
} : {
    'index': `./src/${srcBase}/client`
  }

const config = {
  mode: isProduction ? 'production' : 'development',
  entry,
  output: {
    publicPath,
    path: outputPath,
    filename: outputFilename,
    chunkFilename
  },
  resolve: {
    alias: {
      src: path.join(__dirname, './src'),
      business: path.join(__dirname, './src/business')
    },
    extensions: [".js", ".jsx"],
  },
  externals: ['meta-touch'],
  module: {
    rules: [{
      test: /\.(js|jsx)$/,
      include: origin,
      exclude: /node_modules/,
      use: [{
        loader: 'babel-loader',
        query: {
          // plugins: [
          //   ["import", { "style": "css", "libraryName": "antd" }]
          // ],
          cacheDirectory: true
        }}, {
          loader: 'webpack-conditional-loader'
        }
      ],

    },{
      test: /\.(js|jsx)$/,
      loader: 'source-map-loader',
      include: origin
    },{
      test: /\.(map)$/,
      loader: 'ignore-map-loader',
      include: origin,
    },{
      test: /\.(jpg|png|gif|ico|svg)$/,
      loader: 'url-loader',
      options: {
        limit: 8192,
        name: 'styles/default/images/[hash:8].[name].[ext]'
      },
      include: [
        origin,
        path.resolve('static'),
      ]
    }, {
      test: /\.(woff|eot|ttf)\??.*$/,
      loader: 'url-loader',
      options: {
        name: 'fonts/[name].[md5:hash:hex:7].[ext]'
      }
    }, {
      test: /\.less$/,
      use: [{
        loader: MiniCssExtractPlugin.loader,
        options: {
          hmr: !isProduction
        },
      }, {
        loader: 'css-loader',
        options: {
          importLoaders: 2,
          sourceMap: !isProduction
        },
      }, {
        loader: 'postcss-loader',
        options: {
          ident: 'postcss',
          sourceMap: !isProduction,
          plugins: [
            autoprefixer()
          ]
        }
      }, {
        loader: 'less-loader',
        options: {
          sourceMap: !isProduction
        }
      }]
    }, {
      test: /\.css$/,
      use: [
        isMobile
          ? { loader: 'style-loader' }
          : {
            loader: MiniCssExtractPlugin.loader,
            options: {
              hmr: !isProduction
            },
          },
      {
        loader: 'css-loader',
        options: {
          importLoaders: 2,
          sourceMap: !isProduction
        },
      }, {
        loader: 'postcss-loader',
        options: {
          ident: 'postcss',
          sourceMap: !isProduction,
          plugins: [
            autoprefixer()
          ]
        }
      }]
    }, {
      test: /\.(woff|eot|ttf)\??.*$/,
      loader: 'url-loader',
      options: {
        name: 'fonts/[name].[md5:hash:hex:7].[ext]'
      },
      include: [
        origin,
        path.resolve('static/styles/images'),
      ]
    }]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: cssPath,
      chunkFilename: cssPath,
      ignoreOrder: false, // Enable to remove warnings about conflicting order
    }),
    new webpack.DefinePlugin({
      'process.env.__CLIENT__': 'true',
      'process.env.PREFIX': JSON.stringify(process.env.PREFIX),
      'process.env.__THEMETYPE__': JSON.stringify(package.themeType),
    }),
    new webpack.DllReferencePlugin({
      context: __dirname,
      manifest: require(`./static/scripts/manifest.${envName}.json`)
    })
  ].concat(
    isProduction
      ? [
        new CaseSensitivePathsPlugin(),
        new GenerateAssetPlugin({
          filename: '../bin/version.json',
          fn: (compilation, cb) => {
            cb(null, JSON.stringify({ version: version }, null, '\t'));
          },
          extraFiles: []
        })
      ].concat(
        isMobile
          ? [
            new webpack.BannerPlugin(`服务项目\nupdate: ${nowDateStr}`)
          ]
          : []
      )
      : [
        new webpack.HotModuleReplacementPlugin(),
        new WatchChangedPlugin()
      ]
  ),
  // devtool: isProduction ? 'source-map' : 'cheap-module-eval-source-map',
  // 为了方便调试样式，这里为dev环境也使用了source-map，有可能对性能略有影响，后面再考虑优化
  devtool: 'source-map'
};

if (!isProduction) {
  config.devServer = {
    headers: {
      "Access-Control-Allow-Origin": "*"
    },
    host: '0.0.0.0',
    hot: true,
    inline: true,
    port: scriptPort,
    historyApiFallback: true,
    disableHostCheck: true
  }
  config.cache = true
  config.watchOptions = {
    aggregateTimeout: 1000
  }
}

module.exports = isProduction ? config : smp.wrap(config)
