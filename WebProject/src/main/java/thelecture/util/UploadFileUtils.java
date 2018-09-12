package thelecture.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	private static String bucketName = "thelecture";
	public static String uploadFile(String uploadPath, String originalName, byte[] byteData) {
		S3Util s3 = new S3Util();
		
		//랜덤의 uid 를 만들어준다.
		UUID uid = UUID.randomUUID();

		//savedName : 570d570a-7af1-4afe-8ed5-391d660084b7_g.JPG 같은 형식으로 만들어준다.
		String savedName = "/"+uid.toString() + "_" + originalName;

		//\2017\12\27 같은 형태로 저장해준다.
		String savedPath = calcPath(uploadPath);

		String uploadedFileName = null;

		uploadedFileName = (savedPath + savedName).replace(File.separatorChar, '/');
		//S3Util 의 fileUpload 메서드로 파일을 업로드한다.
		s3.fileUpload(bucketName, uploadPath+uploadedFileName, byteData);


		System.out.println("uploadedFileName:"+uploadedFileName);
		return uploadedFileName;

	}

	public static void deleteFile(String directory, String uploadedPath) {
		S3Util s3 = new S3Util();
		
		s3.fileDelete(bucketName, directory+uploadedPath);
	}

/*public static String uploadFile(String uploadPath, String originalName, File file) {
	S3Util s3 = new S3Util();
	String bucketName = "thelecture";
	//랜덤의 uid 를 만들어준다.

	//\2017\12\27 같은 형태로 저장해준다.
	String savedPath = calcPath(uploadPath);

	String uploadedPath = null;

	uploadedPath = (savedPath+"/").replace(File.separatorChar, '/');
	//S3Util 의 fileUpload 메서드로 파일을 업로드한다.
	s3.fileUpload(bucketName, uploadedPath, file);


//s3.fileUpload(bucketName, new File(fileName))
	System.out.println("uploadedFileName:"+uploadedPath+file.getName());
	return uploadedPath+file.getName();

}*/
	private static String calcPath(String uploadPath) {

		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator + cal.get(Calendar.YEAR);

		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);

		logger.info(datePath);

		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {

			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}