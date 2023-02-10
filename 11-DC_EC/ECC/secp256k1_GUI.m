function secp256k1_GUI()
%David Hill
%Version 1.0.0
%11-14-2019
%Elliptic Curve (secp256k1) (y^2=x^3+7) with
%p = 2^256 - 2^32 - 2^9 - 2^8 - 2^7 - 2^6 - 2^4 - 1.
%Input user private key, 256-bit big-endian hexidecimal (d), output is d*G
%which is the user's public key. Point G defaults to the secp256k1 base
%point. Once you receive the other user's public key, insert it as the point using
%your private key to generate the 256-bit shared key that can be used to
%encrypt or decrypt using AES (Advanced_Encryption_Standard) algorithm. The
%shared key can only be produced by the two users that have shared their
%user's public keys with each other and that have generated the same shared
%key.

gui = figure('MenuBar','none','Name','secp256k1_GUI','Visible','off','Position',[300,300,850,500]);

cipher = uipanel('Title','secp256k1','Units','pixels','Position',[8 8 700 484],'BackgroundColor',[0.9 0.9 0.9]);
    input1 = uicontrol('Parent',cipher,'Style','text','String','Xpoint:','Units','pixels','Position',[6 420 43 16],'BackgroundColor',[0.9 0.9 0.9],'HorizontalAlignment','left');
    input_area1 = uicontrol('Parent',cipher,'Style','edit','String','','Max',2,'Units','pixels','Position',[52 410 638 30],'BackgroundColor',[1 1 1],'HorizontalAlignment','left');
    input3 = uicontrol('Parent',cipher,'Style','text','String','Ypoint:','Units','pixels','Position',[6 390 43 16],'BackgroundColor',[0.9 0.9 0.9],'HorizontalAlignment','left');
    input_area3 = uicontrol('Parent',cipher,'Style','edit','String','','Max',2,'Units','pixels','Position',[52 378 638 30],'BackgroundColor',[1 1 1],'HorizontalAlignment','left');
    input2 = uicontrol('Parent',cipher,'Style','text','String','PriKey:','Units','pixels','Position',[6 360 43 16],'BackgroundColor',[0.9 0.9 0.9],'HorizontalAlignment','left');
    input_area2 = uicontrol('Parent',cipher,'Style','edit','String','','Max',2,'Units','pixels','Position',[52 347 638 30],'BackgroundColor',[1 1 1],'HorizontalAlignment','left');
    output = uicontrol('Parent',cipher,'Style','text','String','Output:','Units','pixels','Position',[6 315 43 16],'BackgroundColor',[0.9 0.9 0.9],'HorizontalAlignment','left');
    output_area = uicontrol('Parent',cipher,'Style','edit','String','','Max',2,'Units','pixels','Position',[52 280 638 50],'BackgroundColor',[1 1 1],'HorizontalAlignment','left');

options = uibuttongroup('Title','Options','Units','pixels','Position',[714 260 130 232],'BackgroundColor',[0.9 0.9 0.9]);
    calculate = uicontrol('Parent',options,'Style','pushbutton','String','Calculate','Units','pixels','Position',[4 70 120 60],'BackgroundColor',[0.9 0.9 0.9],'Callback',@calculate_Callback);
    reset = uicontrol('Parent',options,'Style','pushbutton','String','Reset','Units','pixels','Position',[4 5 120 60],'BackgroundColor',[0.9 0.9 0.9],'Callback',@reset_Callback);

status = uicontrol('Style','text','String','','Units','pixels','Position',[714 235 130 20],'HorizontalAlignment','left');

gui.Visible = 'on';

function calculate_Callback(src,event)
   status.String = 'Starting...';
   pause(0.1);
   if isempty(input_area1.String)
       g1=[];
       g2=[];
   else
       g1=input_area1.String;
       g2=input_area3.String;
   end
   [q1,q2] = secp256k1(input_area2.String,g1,g2);
   output_area.String = sprintf('%s\n%s',q1,q2);
   status.String = 'Done';
end

function reset_Callback(src,event)
   input_area1.String = '';
   input_area2.String = '';
   input_area3.String = '';
   output_area.String = '';
end

end