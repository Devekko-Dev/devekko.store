export default {
  images: {
    formats: ['image/avif', 'image/webp'],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'cdn.devekko.dev',
        pathname: '/s/files/**'
      }
    ]
  }
};
