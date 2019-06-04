package common.utils;

import java.util.Random;

public class RandomCharData {
    //���Խ��ַ�ת����ֵ��int���ͣ��鿴��ASCII��
    public static void main(String[] args) {
        //������ɴ�����
        for(int i=0;i<15;i++)
            createData(20);
        System.out.println("---------------");
                           
        //����������ĸ
        for(int i=0;i<15;i++)
        createRandomCharData(20);
    }
    //����ָ������������ĸ�����ֵ������
    //0~9��ASCIIΪ48~57
    //A~Z��ASCIIΪ65~90
    //a~z��ASCIIΪ97~122
    public static void createRandomCharData(int length)
    {
        StringBuilder sb=new StringBuilder();
        Random rand=new Random();//����������������������
        Random randdata=new Random();
        int data=0;
        for(int i=0;i<length;i++)
        {
            int index=rand.nextInt(3);
            //Ŀ�������ѡ���������֣���Сд��ĸ
            switch(index)
            {
            case 0:
                 data=randdata.nextInt(10);//����������0~9
                 sb.append(data);
                break;
            case 1:
                data=randdata.nextInt(26)+65;//��ֻ֤�����65~90֮�������
                sb.append((char)data);
                break;
            case 2:
                data=randdata.nextInt(26)+97;//��ֻ֤�����97~122֮�������
                sb.append((char)data);
                break;
            }
        }
        String result=sb.toString();
        System.out.println(result);
    }
                       
    //����ָ���������ɴ����ֵ������
    public static void createData(int length) {
        StringBuilder sb=new StringBuilder();
        Random rand=new Random();
        for(int i=0;i<length;i++)
        {
            sb.append(rand.nextInt(10));
        }
        String data=sb.toString();
        System.out.println(length+" random data: "+data);
    }


 //����������ֺ���ĸ,  
    public static String getStringRandom(int length) {  
          
        String val = "";  
        Random random = new Random();  
          
        //����length����ʾ���ɼ�λ�����  
        for(int i = 0; i < length; i++) {  
              
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";  
            //�����ĸ��������  
            if( "char".equalsIgnoreCase(charOrNum) ) {  
                //����Ǵ�д��ĸ����Сд��ĸ  
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;  
                val += (char)(random.nextInt(26) + temp);  
            } else if( "num".equalsIgnoreCase(charOrNum) ) {  
                val += String.valueOf(random.nextInt(10));  
            }  
        }  
        return val;  
   }
}
