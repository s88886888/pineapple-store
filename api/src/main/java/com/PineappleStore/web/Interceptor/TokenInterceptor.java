package com.PineappleStore.web.Interceptor;

import com.PineappleStore.ResultVo.ResultVo;
import com.PineappleStore.ResultVo.StatusVo;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.jsonwebtoken.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@Component
public class TokenInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        String token = request.getHeader("token");

//        查看需要放行的URL
//        System.out.println(request.getRequestURI());

        if (token == null) {
            ResultVo resultVO = new ResultVo("未检测到token，请先登录！", StatusVo.Error, null);
            doResponse(response, resultVO);
        } else {
            
            try {
                JwtParser jwtParser = Jwts.parser();
                jwtParser.setSigningKey("Linson_h");
                Jws<Claims> claimsJws = jwtParser.parseClaimsJws(token);
            } catch (ExpiredJwtException e) {
                ResultVo resultVo = new ResultVo("请先登录", StatusVo.Error, null);
                doResponse(response, resultVo);
                return false;
            } catch (UnsupportedJwtException e) {
                ResultVo resultVo = new ResultVo("Token系统不识别", StatusVo.Error, null);
                doResponse(response, resultVo);
                return false;
            } catch (Exception e) {
                ResultVo resultVO = new ResultVo("未检测到token失效，请先登录！", StatusVo.Error, null);
                doResponse(response, resultVO);
                return false;
            }
            return true;
        }
        return false;
    }


    /**//*给前端返回信息封装方法*//**/
    private void doResponse(HttpServletResponse response, ResultVo resultVO) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String s = new ObjectMapper().writeValueAsString(resultVO);
        out.print(s);
        out.flush();
        out.close();
    }


}
