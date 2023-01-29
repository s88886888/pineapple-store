package com.PineappleStore.web.Controller;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import io.swagger.annotations.Api;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@Api(value = "图片上传", tags = "图片上传")
public class FileController {


    @PostMapping(value = "/upload")
    @ResponseBody
    public ResultVo upload(@RequestParam MultipartFile file, HttpServletRequest req) {


        if (file.isEmpty()) {
            return new ResultVo("图片为空", StatusVo.Error, null);
        }


        String fileName = file.getOriginalFilename();
        String imgName = "." + fileName.split("\\.")[fileName.split("\\.").length - 1];


        String uuid = UUID.randomUUID().toString().replace("-", "");
        String newFileName = uuid + imgName;


        ApplicationHome applicationHome = new ApplicationHome(this.getClass());

        String pre = applicationHome.getDir().getParentFile().getParentFile()
                .getAbsolutePath() + "\\src\\main\\resources\\imgs\\";


        String path = pre + newFileName;

        try {
            file.transferTo(new File(path));
        } catch (IOException | IllegalStateException e) {
            throw new RuntimeException(e);
        }
        String serverFilePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + "/imgs/" + newFileName;
        return new ResultVo("图片上传成功", StatusVo.success, serverFilePath);

    }


}
