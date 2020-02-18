// Audio device management functions
//
module bindbc.raylib.bind.audio;
import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
   }
} else {
   extern (C) @nogc nothrow {
      /**
       * nitialize audio device and context
       */
      alias pInitAudioDevice = void function();
      /**
       * Close the audio device and context (and music stream)
       */
      alias pCloseAudioDevice = void function();
      /**
       * Check if audio device is ready
       */
      alias pIsAudioDeviceReady = bool function();
      /**
       * Set master volume (listener)
       */
      alias pSetMasterVolume = void function(float volume);

      // Wave Sound loading/unloading functions
      /**
       * Load wave data from file
       */
      alias pLoadWave = Wave function(const(char)* fileName);
      /**
       * Load wave data from raw array data
       */
      alias pLoadWaveEx = Wave function(void* data, int sampleCount, int sampleRate, int sampleSize, int channels);
      /**
       * Load sound from file
       */
      alias pLoadSound = Sound function(const(char)* fileName);
      /**
       * Load sound from wave data
       */
      alias pLoadSoundFromWave = Sound function(Wave wave);
      /**
       * Update sound buffer with new data
       */
      alias pUpdateSound = void function(Sound sound, const(void)* data, int samplesCount);
      /**
       * Unload wave data
       */
      alias pUnloadWave = void function(Wave wave);
      /**
       * Unload sound
       */
      alias pUnloadSound = void function(Sound sound);
      /**
       * Export wave data to file
       */
      alias pExportWave = void function(Wave wave, const(char)* fileName);
      /**
       * Export wave sample data to code (.h)
       */
      alias pExportWaveAsCode = void function(Wave wave, const(char)* fileName);

       // Wave Sound management functions
      /**
       * Play a sound
       */
      alias pPlaySound = void function(Sound sound);
      /**
       * Stop playing a sound
       */
      alias pStopSound = void function(Sound sound);
      /**
       * Pause a sound
       */
      alias pPauseSound = void function(Sound sound);
      /**
       * Resume a paused sound
       */
      alias pResumeSound = void function(Sound sound);
      /**
       * Play a sound (using multichannel buffer pool)
       */
      alias pPlaySoundMulti = void function(Sound sound);
      /**
       * Stop any sound playing (using multichannel buffer pool)
       */
      alias pStopSoundMulti = void function();
      /**
       * Get number of sounds playing in the multichannel
       */
      alias pGetSoundsPlaying = int function();
      /**
       * Check if a sound is currently playing
       */
      alias pIsSoundPlaying = bool function(Sound sound);
      /**
       * Set volume for a sound (1.0 is max level)
       */
      alias pSetSoundVolume = void function(Sound sound, float volume);
      /**
       * Set pitch for a sound (1.0 is base level)
       */
      alias pSetSoundPitch = void function(Sound sound, float pitch);
      /**
       * Convert wave data to desired format
       */
      alias pWaveFormat = void function(Wave* wave, int sampleRate, int sampleSize, int channels);
      /**
       * Copy a wave to a new wave
       */
      alias pWaveCopy = Wave function(Wave wave);
      /**
       * Crop a wave to defined samples range
       */
      alias pWaveCrop = void function(Wave* wave, int initSample, int finalSample);
      /**
       * Get samples data from wave as a floats array
       */
      alias pGetWaveData = float* function(Wave wave);

      // Music management functions
      /**
       * Load music stream from file
       */
      alias pLoadMusicStream = Music function(const(char)* fileName);
      /**
       * Unload music stream
       */
      alias pUnloadMusicStream = void function(Music music);
      /**
       * Start music playing
       */
      alias pPlayMusicStream = void function(Music music);
      /**
       * Updates buffers for music streaming
       */
      alias pUpdateMusicStream = void function(Music music);
      /**
       * Stop music playing
       */
      alias pStopMusicStream = void function(Music music);
      /**
       * Pause music playing
       */
      alias pPauseMusicStream = void function(Music music);
      /**
       * Resume playing paused music
       */
      alias pResumeMusicStream = void function(Music music);
      /**
       * Check if music is playing
       */
      alias pIsMusicPlaying = bool function(Music music);
      /**
       * Set volume for music (1.0 is max level)
       */
      alias pSetMusicVolume = void function(Music music, float volume);
      /**
       * Set pitch for a music (1.0 is base level)
       */
      alias pSetMusicPitch = void function(Music music, float pitch);
      /**
       * Set music loop count (loop repeats)
       */
      alias pSetMusicLoopCount = void function(Music music, int count);
      /**
       * Get music time length (in seconds)
       */
      alias pGetMusicTimeLength = float function(Music music);
      /**
       * Get current music time played (in seconds)
       */
      alias pGetMusicTimePlayed = float function(Music music);

      // AudioStream management functions
      /**
       * Init audio stream (to stream raw audio pcm data)
       */
      alias pInitAudioStream = AudioStream function(uint sampleRate, uint sampleSize, uint channels);
      /**
       * Update audio stream buffers with data
       */
      alias pUpdateAudioStream = void function(AudioStream stream, const(void)* data, int samplesCount);
      /**
       * Close audio stream and free memory
       */
      alias pCloseAudioStream = void function(AudioStream stream);
      /**
       * Check if any audio stream buffers requires refill
       */
      alias pIsAudioBufferProcessed = bool function(AudioStream stream);
      /**
       * Play audio stream
       */
      alias pPlayAudioStream = void function(AudioStream stream);
      /**
       * Pause audio stream
       */
      alias pPauseAudioStream = void function(AudioStream stream);
      /**
       * Resume audio stream
       */
      alias pResumeAudioStream = void function(AudioStream stream);
      /**
       * Check if audio stream is playing
       */
      alias pIsAudioStreamPlaying = bool function(AudioStream stream);
      /**
       * Stop audio stream
       */
      alias pStopAudioStream = void function(AudioStream stream);
      /**
       * Set volume for audio stream (1.0 is max level)
       */
      alias pSetAudioStreamVolume = void function(AudioStream stream, float volume);
      /**
       * Set pitch for audio stream (1.0 is base level)
       */
      alias pSetAudioStreamPitch = void function(AudioStream stream, float pitch);
   }
   __gshared {
      pInitAudioDevice InitAudioDevice;
      pCloseAudioDevice CloseAudioDevice;
      pIsAudioDeviceReady IsAudioDeviceReady;
      pSetMasterVolume SetMasterVolume;
      pLoadWave LoadWave;
      pLoadWaveEx LoadWaveEx;
      pLoadSound LoadSound;
      pLoadSoundFromWave LoadSoundFromWave;
      pUpdateSound UpdateSound;
      pUnloadWave UnloadWave;
      pUnloadSound UnloadSound;
      pExportWave ExportWave;
      pExportWaveAsCode ExportWaveAsCode;
      pPlaySound PlaySound;
      pStopSound StopSound;
      pPauseSound PauseSound;
      pResumeSound ResumeSound;
      pPlaySoundMulti PlaySoundMulti;
      pStopSoundMulti StopSoundMulti;
      pGetSoundsPlaying GetSoundsPlaying;
      pIsSoundPlaying IsSoundPlaying;
      pSetSoundVolume SetSoundVolume;
      pSetSoundPitch SetSoundPitch;
      pWaveFormat WaveFormat;
      pWaveCopy WaveCopy;
      pWaveCrop WaveCrop;
      pGetWaveData GetWaveData;
      pLoadMusicStream LoadMusicStream;
      pUnloadMusicStream UnloadMusicStream;
      pPlayMusicStream PlayMusicStream;
      pUpdateMusicStream UpdateMusicStream;
      pStopMusicStream StopMusicStream;
      pPauseMusicStream PauseMusicStream;
      pResumeMusicStream ResumeMusicStream;
      pIsMusicPlaying IsMusicPlaying;
      pSetMusicVolume SetMusicVolume;
      pSetMusicPitch SetMusicPitch;
      pSetMusicLoopCount SetMusicLoopCount;
      pGetMusicTimeLength GetMusicTimeLength;
      pGetMusicTimePlayed GetMusicTimePlayed;
      pInitAudioStream InitAudioStream;
      pUpdateAudioStream UpdateAudioStream;
      pCloseAudioStream CloseAudioStream;
      pIsAudioBufferProcessed IsAudioBufferProcessed;
      pPlayAudioStream PlayAudioStream;
      pPauseAudioStream PauseAudioStream;
      pResumeAudioStream ResumeAudioStream;
      pIsAudioStreamPlaying IsAudioStreamPlaying;
      pStopAudioStream StopAudioStream;
      pSetAudioStreamVolume SetAudioStreamVolume;
      pSetAudioStreamPitch SetAudioStreamPitch;
   }
}
