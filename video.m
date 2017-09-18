videoFReader = vision.VideoFileReader('Megamind.avi');
videoPlayer = vision.VideoPlayer;
while ~isDone(videoFReader)
  videoFrame = step(videoFReader);
  videoFrame = imadjust(videoFrame);
  step(videoPlayer, videoFrame);
end
release(videoPlayer);
release(videoFReader);