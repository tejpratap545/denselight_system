import path from 'path'
import fs from 'fs'
import colors from 'vuetify/es5/util/colors'

export default {
    // Global page headers (https://go.nuxtjs.dev/config-head)
    head: {
        titleTemplate: '%s - Denselight',
        title: 'Dashboard',
        meta: [
            { charset: 'utf-8' },
            { name: 'viewport', content: 'width=device-width, initial-scale=1' },
            { hid: 'description', name: 'description', content: '' },
        ],
        link: [
            { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
            {
                rel: 'stylesheet',
                href: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css',
            },
        ],
        script: [
            { src: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js' },
        ],
    },
    server: {
        host: '0.0.0.0',
        port: 3000,

        https: {
            key: fs.readFileSync(path.resolve(__dirname, 'server.key')),
            cert: fs.readFileSync(path.resolve(__dirname, 'server.crt')),
        },
    },

    // Global CSS (https://go.nuxtjs.dev/config-css)
    css: [],

    // Plugins to run before rendering page (https://go.nuxtjs.dev/config-plugins)
    plugins: ['~/plugins/notifier.js', '~/plugins/axios.js'],

    // Auto import components (https://go.nuxtjs.dev/config-components)
    components: true,

    // Modules for dev and build (recommended) (https://go.nuxtjs.dev/config-modules)
    buildModules: [
        // https://go.nuxtjs.dev/vuetify
        '@nuxtjs/vuetify',
    ],

    loading: {
        color: 'amber',
        height: '5px',
    },

    // Modules (https://go.nuxtjs.dev/config-modules)
    modules: [
        // https://go.nuxtjs.dev/axios
        '@nuxtjs/axios',
        // https://go.nuxtjs.dev/pwa
        '@nuxtjs/pwa',

        '@nuxtjs/auth',
    ],
    pwa: {
        icon: {
            source: 'static/epmp.jpg',
        },
    },

    // Axios module configuration (https://go.nuxtjs.dev/config-axios)
    axios: {
        baseURL: process.env.API_BASE_URL || 'http://127.0.0.1:8000/',
    },

    // Vuetify module configuration (https://go.nuxtjs.dev/config-vuetify)
    vuetify: {
        customVariables: ['~/assets/variables.scss'],
        theme: {
            dark: false,
            themes: {
                dark: {
                    primary: colors.blue.darken2,
                    accent: colors.grey.darken3,
                    secondary: colors.amber.darken3,
                    info: colors.teal.lighten1,
                    warning: colors.amber.base,
                    error: colors.deepOrange.accent4,
                    success: colors.green.accent3,
                },
            },
        },
        icons: {
            iconfont: 'fa',
        },
    },

    // Build Configuration (https://go.nuxtjs.dev/config-build)
    build: {},

    // env variable https://nuxtjs.org/blog/moving-from-nuxtjs-dotenv-to-runtime-config/
    publicRuntimeConfig: {
        apiBaseURL: process.env.API_BASE_URL || 'http://127.0.0.1:8000/',
    },
    privateRuntimeConfig: {},
    auth: {
        localStorage: false,
        cookie: {
            options: {
                expires: 7,
            },
        },
        strategies: {
            local: {
                endpoints: {
                    login: { url: '/auth/token/', method: 'post', propertyName: false },
                    logout: false,
                    user: false,
                },
                tokenType: 'Bearer',
            },
        },
        redirect: {
            login: '/login',
            logout: '/login',
            callback: '/login',
            home: '/',
        },
        plugins: ['~/plugins/axios.js', '~/plugins/auth.js'],
    },
    router: {
        middleware: ['auth'],
    },
}
