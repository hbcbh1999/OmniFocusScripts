FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ~x
	This script clears all flags from all projects and actions.
	
	version 0.1, by Curt Clifton
	
	Copyright � 2007, Curtis Clifton
	
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     � 	 	
� 
 	 T h i s   s c r i p t   c l e a r s   a l l   f l a g s   f r o m   a l l   p r o j e c t s   a n d   a c t i o n s . 
 	 
 	 v e r s i o n   0 . 1 ,   b y   C u r t   C l i f t o n 
 	 
 	 C o p y r i g h t   �   2 0 0 7 ,   C u r t i s   C l i f t o n 
 	 
 	 A l l   r i g h t s   r e s e r v e d . 
 	 
 	 R e d i s t r i b u t i o n   a n d   u s e   i n   s o u r c e   a n d   b i n a r y   f o r m s ,   w i t h   o r   w i t h o u t   m o d i f i c a t i o n ,   a r e   p e r m i t t e d   p r o v i d e d   t h a t   t h e   f o l l o w i n g   c o n d i t i o n s   a r e   m e t : 
 	 
 	 	 "   R e d i s t r i b u t i o n s   o f   s o u r c e   c o d e   m u s t   r e t a i n   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r . 
 	 	 
 	 	 "   R e d i s t r i b u t i o n s   i n   b i n a r y   f o r m   m u s t   r e p r o d u c e   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r   i n   t h e   d o c u m e n t a t i o n   a n d / o r   o t h e r   m a t e r i a l s   p r o v i d e d   w i t h   t h e   d i s t r i b u t i o n . 
 	 	 
 	 T H I S   S O F T W A R E   I S   P R O V I D E D   B Y   T H E   C O P Y R I G H T   H O L D E R S   A N D   C O N T R I B U T O R S   " A S   I S "   A N D   A N Y   E X P R E S S   O R   I M P L I E D   W A R R A N T I E S ,   I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   T H E   I M P L I E D   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y   A N D   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A R E   D I S C L A I M E D .   I N   N O   E V E N T   S H A L L   T H E   C O P Y R I G H T   O W N E R   O R   C O N T R I B U T O R S   B E   L I A B L E   F O R   A N Y   D I R E C T ,   I N D I R E C T ,   I N C I D E N T A L ,   S P E C I A L ,   E X E M P L A R Y ,   O R   C O N S E Q U E N T I A L   D A M A G E S   ( I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   P R O C U R E M E N T   O F   S U B S T I T U T E   G O O D S   O R   S E R V I C E S ;   L O S S   O F   U S E ,   D A T A ,   O R   P R O F I T S ;   O R   B U S I N E S S   I N T E R R U P T I O N )   H O W E V E R   C A U S E D   A N D   O N   A N Y   T H E O R Y   O F   L I A B I L I T Y ,   W H E T H E R   I N   C O N T R A C T ,   S T R I C T   L I A B I L I T Y ,   O R   T O R T   ( I N C L U D I N G   N E G L I G E N C E   O R   O T H E R W I S E )   A R I S I N G   I N   A N Y   W A Y   O U T   O F   T H E   U S E   O F   T H I S   S O F T W A R E ,   E V E N   I F   A D V I S E D   O F   T H E   P O S S I B I L I T Y   O F   S U C H   D A M A G E . 
   
  
 l     ��������  ��  ��        l      ��  ��    M G
	The following properties are used for script notification via Growl.
     �   � 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   s c r i p t   n o t i f i c a t i o n   v i a   G r o w l . 
      j     �� �� 0 growlappname growlAppName  m        �    C u r t ' s   S c r i p t s      j    �� �� 20 scriptstartnotification scriptStartNotification  m       �    S c r i p t   B e g a n      j    �� �� 40 scriptfinishnotification scriptFinishNotification  m       �     S c r i p t   C o m p l e t e d     !   j   	 �� "�� ,0 defaultnotifications defaultNotifications " J   	  # #  $�� $ o   	 
���� 40 scriptfinishnotification scriptFinishNotification��   !  % & % j    �� '�� $0 allnotifications allNotifications ' b     ( ) ( o    ���� ,0 defaultnotifications defaultNotifications ) J     * *  +�� + o    ���� 20 scriptstartnotification scriptStartNotification��   &  , - , j    �� .�� 00 iconloaningapplication iconLoaningApplication . m     / / � 0 0  O m n i F o c u s . a p p -  1 2 1 l     ��������  ��  ��   2  3 4 3 l    > 5���� 5 O     > 6 7 6 k    = 8 8  9 : 9 I   ������
�� .miscactvnull���    obj ��  ��   :  ; < ; r     = > = I   �� ? @
�� .sysodisAaleR        TEXT ? m     A A � B B . R e a l l y   c l e a r   a l l   f l a g s ? @ �� C D
�� 
mesS C m     E E � F F l I s   i t   O K   t o   c l e a r   f l a g s   f r o m   a l l   p r o j e c t s   a n d   a c t i o n s ? D �� G H
�� 
as A G m    ��
�� EAlTwarN H �� I J
�� 
btns I J     K K  L M L m     N N � O O  O K M  P�� P m     Q Q � R R  C a n c e l��   J �� S��
�� 
dflt S m     T T � U U  C a n c e l��   > o      ���� 0 
alertreply 
alertReply <  V W V Z    2 X Y���� X l    ) Z���� Z =    ) [ \ [ n     % ] ^ ] 1   ! %��
�� 
bhit ^ o     !���� 0 
alertreply 
alertReply \ m   % ( _ _ � ` `  C a n c e l��  ��   Y L   , .����  ��  ��   W  a b a l   3 3�� c d��   c � � set theFlaggedActions to (every task whose flagged is false)
	repeat with anAction in theFlaggedActions
		set flagged of anAction to false
	end repeat
	return     d � e e@   s e t   t h e F l a g g e d A c t i o n s   t o   ( e v e r y   t a s k   w h o s e   f l a g g e d   i s   f a l s e ) 
 	 r e p e a t   w i t h   a n A c t i o n   i n   t h e F l a g g e d A c t i o n s 
 	 	 s e t   f l a g g e d   o f   a n A c t i o n   t o   f a l s e 
 	 e n d   r e p e a t 
 	 r e t u r n   b  f�� f r   3 = g h g N   3 9 i i 2   3 8��
�� 
FCSX h o      ���� 80 toplevelprojectsandfolders topLevelProjectsAndFolders��   7 n      j k j 4   �� l
�� 
docu l m    ����  k m      m m�                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  )��M        ����  	                Applications    �W��      �V       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  ��  ��   4  n o n l     ��������  ��  ��   o  p q p l  ? O r���� r n  ? O s t s I   @ O�� u���� 
0 notify   u  v w v m   @ C x x � y y $ C l e a r i n g   A l l   F l a g s w  z { z m   C F | | � } } X C l e a r i n g   f l a g s   f r o m   a l l   p r o j e c t s   a n d   a c t i o n s {  ~�� ~ o   F K���� 20 scriptstartnotification scriptStartNotification��  ��   t  f   ? @��  ��   q   �  l  P X ����� � I   P X�� ����� 0 
clearflags 
clearFlags �  ��� � o   Q T���� 80 toplevelprojectsandfolders topLevelProjectsAndFolders��  ��  ��  ��   �  � � � l  Y i ����� � n  Y i � � � I   Z i�� ����� 
0 notify   �  � � � m   Z ] � � � � � " A l l   f l a g s   c l e a r e d �  � � � m   ] ` � � � � � V F l a g s   c l e a r e d   f r o m   a l l   p r o j e c t s   a n d   a c t i o n s �  ��� � o   ` e���� 40 scriptfinishnotification scriptFinishNotification��  ��   �  f   Y Z��  ��   �  � � � l  j l ����� � L   j l����  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   � � z 
	Recurses over the tree, clearing flags from projects and actions.
	theSections: a list of folders, projects, and tasks
    � � � � �   
 	 R e c u r s e s   o v e r   t h e   t r e e ,   c l e a r i n g   f l a g s   f r o m   p r o j e c t s   a n d   a c t i o n s . 
 	 t h e S e c t i o n s :   a   l i s t   o f   f o l d e r s ,   p r o j e c t s ,   a n d   t a s k s 
 �  � � � i     � � � I      �� ����� 0 
clearflags 
clearFlags �  ��� � o      ���� 0 thesections theSections��  ��   � X      ��� � � I    �� ����� $0 clearflagshelper clearFlagsHelper �  ��� � o    ���� 0 asection aSection��  ��  �� 0 asection aSection � o    ���� 0 thesections theSections �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   � � � 
	Recurses over the tree rooted at the given item, clearing flags from projects and actions.
	theItem: a folder, project, or task
    � � � �   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   i t e m ,   c l e a r i n g   f l a g s   f r o m   p r o j e c t s   a n d   a c t i o n s . 
 	 t h e I t e m :   a   f o l d e r ,   p r o j e c t ,   o r   t a s k 
 �  � � � i     � � � I      �� ����� $0 clearflagshelper clearFlagsHelper �  ��� � o      ���� 0 theitem theItem��  ��   � w     5 � � � Z    5 � � � � � l    ����� � =    � � � n     � � � 1    ��
�� 
pcls � o    ���� 0 theitem theItem � m    ��
�� 
FCpr��  ��   � k   
  � �  � � � r   
  � � � n   
  � � � 1    ��
�� 
FCrt � o   
 ���� 0 theitem theItem � o      ���� 0 
theproject 
theProject �  ��� � L     � � n    � � � I    �� �����  0 clearflagstask clearFlagsTask �  ��� � o    ���� 0 
theproject 
theProject��  ��   �  f    ��   �  � � � l    ����� � =    � � � n     � � � 1    ��
�� 
pcls � o    ���� 0 theitem theItem � m    ��
�� 
FCAr��  ��   �  ��� � L   " ) � � n  " ( � � � I   # (�� ����� $0 clearflagsfolder clearFlagsFolder �  ��� � o   # $���� 0 theitem theItem��  ��   �  f   " #��   � k   , 5 � �  � � � L   , 3 � � n  , 2 � � � I   - 2�� �����  0 clearflagstask clearFlagsTask �  ��� � o   - .���� 0 theitem theItem��  ��   �  f   , - �  ��� � l  4 4��������  ��  ��  ��   ��                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  )��M        ����  	                Applications    �W��      �V       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��   �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   � u o 
	Recurses over the tree rooted at the given task, clearing flags from projects and actions.
	theTask: a task
    � � � � �   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   t a s k ,   c l e a r i n g   f l a g s   f r o m   p r o j e c t s   a n d   a c t i o n s . 
 	 t h e T a s k :   a   t a s k 
 �  � � � i     # � � � I      � ��~�  0 clearflagstask clearFlagsTask �  ��} � o      �|�| 0 thetask theTask�}  �~   � w      � � � O     � � � k     � �  � � � r     � � � m    �{
�{ boovfals � n       � � � 1    
�z
�z 
FCfl �  g     �  � � � r     � � � N     � � 2    �y
�y 
FCac � o      �x�x 0 
childtasks 
childTasks �  ��w � L       n    I    �v�u�v 0 
clearflags 
clearFlags �t o    �s�s 0 
childtasks 
childTasks�t  �u    f    �w   � o    �r�r 0 thetask theTask ��                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  )��M        ����  	                Applications    �W��      �V       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��   �  l     �q�p�o�q  �p  �o    l      �n	
�n  	 { u 
	Recurses over the tree rooted at the given folder, clearing flags from projects and actions.
	theFolder: a folder
   
 � �   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   f o l d e r ,   c l e a r i n g   f l a g s   f r o m   p r o j e c t s   a n d   a c t i o n s . 
 	 t h e F o l d e r :   a   f o l d e r 
  i   $ ' I      �m�l�m $0 clearflagsfolder clearFlagsFolder �k o      �j�j 0 	thefolder 	theFolder�k  �l   w      k      r     N     n     2    �i
�i 
FCSX o    �h�h 0 	thefolder 	theFolder o      �g�g 0 thechildren theChildren �f L   	  n  	  I   
 �e �d�e 0 
clearflags 
clearFlags  !�c! o   
 �b�b 0 thechildren theChildren�c  �d    f   	 
�f  �                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  )��M        ����  	                Applications    �W��      �V       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��   "#" l     �a�`�_�a  �`  �_  # $%$ l      �^&'�^  &
	Uses Growl to display a notification message.
	theTitle � a string giving the notification title
	theDescription � a string describing the notification event
	theNotificationKind � a string giving the notification kind (must be an element of allNotifications)
   ' �(( 
 	 U s e s   G r o w l   t o   d i s p l a y   a   n o t i f i c a t i o n   m e s s a g e . 
 	 t h e T i t l e      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   t i t l e 
 	 t h e D e s c r i p t i o n      a   s t r i n g   d e s c r i b i n g   t h e   n o t i f i c a t i o n   e v e n t 
 	 t h e N o t i f i c a t i o n K i n d      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   k i n d   ( m u s t   b e   a n   e l e m e n t   o f   a l l N o t i f i c a t i o n s ) 
% )�]) i   ( +*+* I      �\,�[�\ 
0 notify  , -.- o      �Z�Z 0 thetitle theTitle. /0/ o      �Y�Y  0 thedescription theDescription0 1�X1 o      �W�W *0 thenotificationkind theNotificationKind�X  �[  + O     4232 k    344 565 I   !�V�U7
�V .registernull��� ��� null�U  7 �T89
�T 
appl8 o    �S�S 0 growlappname growlAppName9 �R:;
�R 
anot: o    �Q�Q $0 allnotifications allNotifications; �P<=
�P 
dnot< o    �O�O ,0 defaultnotifications defaultNotifications= �N>�M
�N 
iapp> o    �L�L 00 iconloaningapplication iconLoaningApplication�M  6 ?�K? I  " 3�J�I@
�J .notifygrnull��� ��� null�I  @ �HAB
�H 
nameA o   $ %�G�G *0 thenotificationkind theNotificationKindB �FCD
�F 
titlC o   & '�E�E 0 thetitle theTitleD �DEF
�D 
applE o   ( -�C�C 0 growlappname growlAppNameF �BG�A
�B 
descG o   . /�@�@  0 thedescription theDescription�A  �K  3 m     HH2                                                                                  GRRR   alis    �  Mac Book Pro               �WXfH+   8 �GrowlHelperApp.app                                              8 ��n̥        ����  	                	Resources     �W��      �o�     8 � 8 � 8 �  �     YMac Book Pro:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c   B o o k   P r o  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  �]       �?I   JK /LMNOPQRS�>�=�<�;�:�9�8�7�6�5�?  I �4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����4 0 growlappname growlAppName�3 20 scriptstartnotification scriptStartNotification�2 40 scriptfinishnotification scriptFinishNotification�1 ,0 defaultnotifications defaultNotifications�0 $0 allnotifications allNotifications�/ 00 iconloaningapplication iconLoaningApplication�. 0 
clearflags 
clearFlags�- $0 clearflagshelper clearFlagsHelper�,  0 clearflagstask clearFlagsTask�+ $0 clearflagsfolder clearFlagsFolder�* 
0 notify  
�) .aevtoappnull  �   � ****�( 0 
alertreply 
alertReply�' 80 toplevelprojectsandfolders topLevelProjectsAndFolders�&  �%  �$  �#  �"  �!  �   �  �  �  J �T� T   K �U� U    L � ���VW�� 0 
clearflags 
clearFlags� �X� X  �� 0 thesections theSections�  V ��� 0 thesections theSections� 0 asection aSectionW ����
� 
kocl
� 
cobj
� .corecnte****       ****� $0 clearflagshelper clearFlagsHelper�  �[��l kh *�k+ [OY��M � ���YZ�� $0 clearflagshelper clearFlagsHelper� �
[�
 [  �	�	 0 theitem theItem�  Y ��� 0 theitem theItem� 0 
theproject 
theProjectZ  �������
� 
pcls
� 
FCpr
� 
FCrt�  0 clearflagstask clearFlagsTask
� 
FCAr� $0 clearflagsfolder clearFlagsFolder� 6�Z��,�  ��,E�O)�k+ Y ��,�  )�k+ Y )�k+ OPN �  �����\]���   0 clearflagstask clearFlagsTask�� ��^�� ^  ���� 0 thetask theTask��  \ ������ 0 thetask theTask�� 0 
childtasks 
childTasks]  �������
�� 
FCfl
�� 
FCac�� 0 
clearflags 
clearFlags�� �Z� f*�,FO*�-E�O)�k+ UO ������_`���� $0 clearflagsfolder clearFlagsFolder�� ��a�� a  ���� 0 	thefolder 	theFolder��  _ ������ 0 	thefolder 	theFolder�� 0 thechildren theChildren` ����
�� 
FCSX�� 0 
clearflags 
clearFlags�� �Z��-E�O)�k+ P ��+����bc���� 
0 notify  �� ��d�� d  �������� 0 thetitle theTitle��  0 thedescription theDescription�� *0 thenotificationkind theNotificationKind��  b �������� 0 thetitle theTitle��  0 thedescription theDescription�� *0 thenotificationkind theNotificationKindc H��������������������
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null
�� 
name
�� 
titl
�� 
desc
�� .notifygrnull��� ��� null�� 5� 1*�b   �b  �b  �b  � O*���b   �� 
UQ ��e����fg��
�� .aevtoappnull  �   � ****e k     lhh  3ii  pjj  kk  �ll  �����  ��  ��  f  g  m���� A�� E������ N Q�� T�������� _���� x |���� � �
�� 
docu
�� .miscactvnull���    obj 
�� 
mesS
�� 
as A
�� EAlTwarN
�� 
btns
�� 
dflt�� 
�� .sysodisAaleR        TEXT�� 0 
alertreply 
alertReply
�� 
bhit
�� 
FCSX�� 80 toplevelprojectsandfolders topLevelProjectsAndFolders�� 
0 notify  �� 0 
clearflags 
clearFlags�� m��k/ 8*j O��������lv��� E�O�a ,a   hY hO*a -E` UO)a a b  m+ O*_ k+ O)a a b  m+ OhR ��m��
�� 
bhitm �nn  O K��  S oo p��p  m����
�� 
docu�� 
�� 
FCSX�>  �=  �<  �;  �:  �9  �8  �7  �6  �5  ascr  ��ޭ