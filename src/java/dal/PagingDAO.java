/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;

/**
 *
 * @author dell
 */
public class PagingDAO {
    // tra ve tong so trang cua 1 danh sach . 
    public static <T> int getNumberPage(List<T> list, int numberOnePage) {
        if (list == null || list.isEmpty() || numberOnePage <= 0) {
            return 0 ; 
        }

        int totalItems = list.size();
        int numberOfPages = (int) Math.ceil((double) totalItems / numberOnePage);

        return numberOfPages;
    }
}
