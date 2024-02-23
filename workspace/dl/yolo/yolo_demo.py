import cv2
import numpy as np

def load_yolo():
    # model = cv2.dnn.readNet("yolov3-tiny.weights", "yolov3-tiny.cfg")
    model = cv2.dnn.readNet("yolov3.weights", "yolov3.cfg")

    classes = None
    with open('coco.names', 'r') as f:
        lines = f.readlines()
        classes = [line.strip() for line in lines]

    layer_names = [layer_name for layer_name in model.getUnconnectedOutLayersNames()]
    colors = np.random.uniform(0, 255, size=(len(classes), 3)) # 80 X 3 -> 80개의 RGB 색상 배열

    return model, classes, layer_names, colors

def load_image(image_path):
    image = cv2.imread(image_path)
    image = cv2.resize(image, None, fx=0.5, fy=0.5)
    height, width, channels = image.shape
    return image, height, width, channels

def detect_objects(image, model, layers):
    # yolo 모델에 입력할 수 있도록 데이터 형식 구성
    blob = cv2.dnn.blobFromImage(image, scalefactor=1/255, size=(320, 320), mean=(0,0,0), swapRB=True)
    model.setInput(blob)
    outputs = model.forward(layers) # object detection + 결과 반환
    return blob, outputs

def get_box_dimensions(outputs, height, width):
	boxes = []
	confs = []
	class_ids = []
	for output in outputs:
		for detect in output:
			scores = detect[5:]
			class_id = np.argmax(scores) # 신뢰도 높은 object 찾기
			conf = scores[class_id]      # 신뢰도 점수
			if conf > 0.3:
				center_x = int(detect[0] * width)
				center_y = int(detect[1] * height)
				w = int(detect[2] * width)
				h = int(detect[3] * height)
				x = int(center_x - w/2)
				y = int(center_y - h / 2)
				boxes.append([x, y, w, h])
				confs.append(float(conf))
				class_ids.append(class_id)
	return boxes, confs, class_ids

def draw_labels(boxes, confs, colors, class_ids, classes, img): 
	indexes = cv2.dnn.NMSBoxes(boxes, confs, 0.5, 0.4) # 중복 박스 중에서 중요한 박스만 검출
	font = cv2.FONT_HERSHEY_PLAIN
	for i in range(len(boxes)):
		if i in indexes:
			x, y, w, h = boxes[i]
			label = str(classes[class_ids[i]])
			color = colors[i]
			cv2.rectangle(img, (x,y), (x+w, y+h), color, 2)
			cv2.putText(img, label, (x, y - 5), font, 1, color, 1)
	cv2.imshow("Image", img)
	
def image_detect(image_path):
	model, classes, layer_names, colors = load_yolo()
	image, height, width, channels = load_image(image_path)
	blob, outputs = detect_objects(image, model, layer_names)
	boxes, confs, class_ids = get_box_dimensions(outputs, height, width)
	draw_labels(boxes, confs, colors, class_ids, classes, image)
	
	
	while True:
		key = cv2.waitKey(1) # wait keyboard input
		if key == 27: # esc key
			break
		
def video_detect(video_path):
	model, classes, layer_names, colors = load_yolo()
	cap = cv2.VideoCapture(video_path)
	while True:
		_, frame = cap.read() # 한 frame 읽기
	    # print(frame.shape)
		height, width, channels = frame.shape
		blob, outputs = detect_objects(frame, model, layer_names)
		boxes, confs, class_ids = get_box_dimensions(outputs, height, width)
		draw_labels(boxes, confs, colors, class_ids, classes, frame)

		key = cv2.waitKey(1) # wait keyboard input
		if key == 27: # esc key
			break
		
def webcam_detect():
	model, classes, layer_names, colors = load_yolo()
	cap = cv2.VideoCapture(0)
	while True:
		_, frame = cap.read() # 한 frame 읽기
	    # print(frame.shape)
		height, width, channels = frame.shape
		blob, outputs = detect_objects(frame, model, layer_names)
		boxes, confs, class_ids = get_box_dimensions(outputs, height, width)
		draw_labels(boxes, confs, colors, class_ids, classes, frame)

		key = cv2.waitKey(1) # wait keyboard input
		if key == 27: # esc key
			break
	cap.release()
	
	

# python yolo_demo.py 형식으로 실행했을 때 True
# import yolo_demo 형식으로 실행했을 때 False
if __name__ == "__main__": 

    # test for load_model function
    # model, classes, layer_names, colors = load_yolo()
    # # print(classes)
    # print(colors[:5])

    # test for load_image
    # image, height, width, channels = load_image('images/busy_street.jpg')
    # cv2.imshow('image', image)
    # while True:
    #     key = cv2.waitKey(1) # wait keyboard input
    #     if key == 27: # esc key
    #         break
    # cv2.destroyAllWindows()

    # test for detect_objects
    # blob, outputs = detect_objects(image, model, layer_names)

    # print(len(outputs))
    # print(outputs[0].shape, outputs[1].shape)
	
    ###############################################

    # image_detect('images/bicycle.jpg')
	
    # video_detect('videos/bird.mp4')
	
    webcam_detect()
	
    cv2.destroyAllWindows()


        
    