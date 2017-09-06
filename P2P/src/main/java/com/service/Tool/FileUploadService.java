package com.service.Tool;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	public Map SaveFile(MultipartFile myfile) throws IllegalStateException, IOException;
}
