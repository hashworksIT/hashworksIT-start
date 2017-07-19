module.exports = function () {

var root = './';
 var nodeModules = 'node_modules';
var assets='_assets';
var temp='tmp';
 var config = {
     temp:temp,
     build: './assets',
     vendor_css: assets + '/css/vendor/*.css',
     fonts: assets + '/fonts/*.*',
     images: assets + '/images/**/**/**/*.*',
     page_sass: assets + '/css/pages/_sass/*.scss',
     js:assets + '/js',
    /**
     * browser sync
     */
    browserReloadDelay: 1000,
      packages: [
      './package.json'
    ],
    deploy:'./_site'
 }

 return config;

}
