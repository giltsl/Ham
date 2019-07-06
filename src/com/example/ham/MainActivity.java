package com.example.ham;

import android.app.Activity;
import android.media.MediaPlayer;
import android.os.Bundle;

public class MainActivity extends Activity {

	static MediaPlayer mPlayer;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
//		setContentView(R.layout.activity_main);
		
		mPlayer = MediaPlayer.create(this, R.raw.ham);
		mPlayer.start();
		finish();
		/*
		View hamButton = findViewById(R.id.ham_button);
		hamButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				mPlayer.start();
				
			}
		});
		*/
		
		
		
		
	}
}
