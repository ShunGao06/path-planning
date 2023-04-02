%findWayBack������������·�����ݣ���������������������ֹ��goalposind�;���fieldpointers�����������P
function [p,posind] = findWayBack(goalposind,fieldpointers)

    n = length(fieldpointers);  % ��ȡ�����ĳ���Ҳ����n
    posind = goalposind;
    posind1=posind;
    [py,px] = ind2sub([n,n],posind); % ������ֵposindת��Ϊ����ֵ [py,px]
    p = [py px];
    
    %����whileѭ�����л��ݣ������ǻ��ݵ���ʼ���ʱ��ֹͣ��Ҳ�����ھ���fieldpointers���ҵ�Sʱֹͣ
    a=fieldpointers{posind};
    while ~strcmp(a,'S')
      switch a
          
        case 'L' % ��L�� ��ʾ��ǰ�ĵ�������ߵĵ���չ������
          px = px - 1;  
        case 'R' % ��R�� ��ʾ��ǰ�ĵ������ұߵĵ���չ������
          px = px + 1;
        case 'U' % ��U�� ��ʾ��ǰ�ĵ���������ĵ���չ������
          py = py - 1;
        case 'D' % ��D�� ��ʾ��ǰ�ĵ������±ߵĵ���չ������
          py = py + 1;
        case 'RU' % ��RU�� ��ʾ��ǰ�ĵ��������ϵĵ���չ������
          px = px + 1 ;  py = py - 1;  
        case 'RD' % ��RD�� ��ʾ��ǰ�ĵ��������±ߵĵ���չ������
          px = px + 1 ;  py = py + 1; 
        case 'LU' % ��LU�� ��ʾ��ǰ�ĵ��������ϱߵĵ���չ������
          px = px -1 ;  py = py - 1; 
        case 'LD' % ��LD�� ��ʾ��ǰ�ĵ��������±ߵĵ���չ������
          px = px - 1 ;  py = py + 1; 
      end
      p = [p; py px];
      posind = sub2ind([n,n],py,px);% ������ֵת��Ϊ����ֵ
      posind1=[posind1;posind];
      a=fieldpointers{posind};
    end
end