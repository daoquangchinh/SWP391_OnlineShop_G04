/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

/**
 *
 * @author dell
 */
public class VariabeStatic {
    // mat khau mac dinh khi cap account
    public static String stringPassword = "123456" ; 
    
    // check mot chuoi co gom toan cac space hay khong
    public static boolean checkStringFullSpace(String s ){
        
        for(int i = 0 ;  i< s.length() ; ++i){
            if(s.charAt(i) != ' ') return false;
        }
        return true;
    }
    
    
    
    
}
