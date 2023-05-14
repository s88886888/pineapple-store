package com.PineappleStore.web.Controller;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import io.swagger.annotations.Api;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Objects;
import java.util.UUID;

@RestController
@RequestMapping("/upload")
@Api(value = "图片上传", tags = "图片上传")
public class FileController {

    //文件路径
    @Value(value = "${filePath}")
    private String filePath;

    @Value(value = "${localHostUrl}")
    private String localHostUrl;


    @PostMapping("/")
    @ResponseBody
    public ResultVo upload(@NotNull @RequestParam MultipartFile file) {


        if (file.isEmpty()) {
            return new ResultVo("上传文件不可以为空", StatusVo.Error, null);
        }
        //判断文件类型
        String fileType = file.getContentType();

        assert fileType != null;
        if (!fileType.split("/")[0].equals("image")) {
            return new ResultVo("文件不是图片类型，上传失败", StatusVo.Error, null);
        }

        //获取文件的后缀
        String fileSuffix = Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf("."));
        //随机生成文件名称
        UUID uuid = UUID.randomUUID();


        try {
            //路径+文件名+文件后缀
            file.transferTo(new File(filePath + uuid + fileSuffix));

        } catch (IOException | IllegalStateException e) {
            throw new RuntimeException(e);
        }
//        InetAddress localHost = InetAddress.getLocalHost();
//        return new ResultVo("图片上传成功", StatusVo.success, "http://" + localHost.getHostAddress() + ":" + port + "/" + "image/" + uuid + fileSuffix);
        return new ResultVo("图片上传成功", StatusVo.success, localHostUrl + uuid + fileSuffix);

    }


}
