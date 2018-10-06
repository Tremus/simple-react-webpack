const HtmlWebPackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: './src/index.jsx',
    devServer: {
        host: '0.0.0.0',
        port: 3000,
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader',
                },
            },
        ],
    },
    plugins: [
        new HtmlWebPackPlugin({
            template: './src/index.html',
            filename: './index.html',
        }),
    ],
};
