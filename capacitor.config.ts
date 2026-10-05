import type { CapacitorConfig } from '@capacitor/cli';
const config: CapacitorConfig = {
  appId: 'app.nextchat',
  appName: 'NextChat',
  webDir: 'out',
  android: { allowMixedContent: true },
  server: { androidScheme: 'https' },
  plugins: { Keyboard: { resizeOnFullScreen: true } },
};
export default config;
