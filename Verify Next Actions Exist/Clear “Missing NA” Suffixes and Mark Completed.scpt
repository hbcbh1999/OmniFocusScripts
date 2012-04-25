FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ic
	This script takes the currently selected actions or projects, strips the Missing NA suffix added by the Verify Next Actions Exist script, and marks the items completed.
	
	version 0.2, by Curt Clifton
	
	Copyright � 2007, Curtis Clifton
	
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	version 0.5.2: Added completion
	version 0.1.1: Fixed bug that was exposed by OmniFocus 1.1
	version 0.1: Original release
     � 	 	� 
 	 T h i s   s c r i p t   t a k e s   t h e   c u r r e n t l y   s e l e c t e d   a c t i o n s   o r   p r o j e c t s ,   s t r i p s   t h e   M i s s i n g   N A   s u f f i x   a d d e d   b y   t h e   V e r i f y   N e x t   A c t i o n s   E x i s t   s c r i p t ,   a n d   m a r k s   t h e   i t e m s   c o m p l e t e d . 
 	 
 	 v e r s i o n   0 . 2 ,   b y   C u r t   C l i f t o n 
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
 	 
 	 v e r s i o n   0 . 5 . 2 :   A d d e d   c o m p l e t i o n 
 	 v e r s i o n   0 . 1 . 1 :   F i x e d   b u g   t h a t   w a s   e x p o s e d   b y   O m n i F o c u s   1 . 1 
 	 v e r s i o n   0 . 1 :   O r i g i n a l   r e l e a s e 
   
  
 l     ��������  ��  ��        j     �� �� "0 missingnasuffix missingNASuffix  m        �    M i s s i n g   N A      j    �� �� (0 missingnadelimiter missingNADelimiter  m       �          j    
�� �� 0 suffixtostrip suffixToStrip  b    	    o    ���� (0 missingnadelimiter missingNADelimiter  o    ���� "0 missingnasuffix missingNASuffix      j    �� �� 0 suffixlength suffixLength  I   �� ��
�� .corecnte****       ****  o    ���� 0 suffixtostrip suffixToStrip��         l     ��������  ��  ��      ! " ! l    � #���� # O     � $ % $ O    � & ' & O     ( ) ( k    ~ * *  + , + r     - . - n     / 0 / 1    ��
�� 
valL 0 n     1 2 1 2   ��
�� 
OTst 2 1    ��
�� 
FCcn . o      ���� $0 theselecteditems theSelectedItems ,  3�� 3 X    ~ 4�� 5 4 O   , y 6 7 6 Z   0 x 8 9���� 8 l  0 9 :���� : D   0 9 ; < ; 1   0 3��
�� 
pnam < o   3 8���� 0 suffixtostrip suffixToStrip��  ��   9 k   < t = =  > ? > r   < T @ A @ n   < R B C B 7  @ R�� D E
�� 
ctxt D m   D F����  E l  G Q F���� F ]   G Q G H G m   H I������ H l  I P I���� I [   I P J K J o   I N���� 0 suffixlength suffixLength K m   N O���� ��  ��  ��  ��   C l  < @ L���� L e   < @ M M 1   < @��
�� 
pnam��  ��   A o      ���� 0 newname newName ?  N O N r   U Z P Q P o   U V���� 0 newname newName Q 1   V Y��
�� 
pnam O  R�� R Z   [ t S T�� U S =  [ ` V W V n   [ ^ X Y X 1   \ ^��
�� 
pcls Y  g   [ \ W m   ^ _��
�� 
FCpr T r   c j Z [ Z m   c d��
�� FCPsFCPd [ 1   d i��
�� 
FCPs��   U r   m t \ ] \ m   m n��
�� boovtrue ] 1   n s��
�� 
FCcd��  ��  ��   7 o   , -���� 0 anitem anItem�� 0 anitem anItem 5 o     ���� $0 theselecteditems theSelectedItems��   ) 4    �� ^
�� 
FCdw ^ m    ����  ' 4   �� _
�� 
docu _ m    ����  % m      ` `�                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  ��  ��   "  a b a l     ��������  ��  ��   b  c�� c l     ��������  ��  ��  ��       �� d   e�� f��   d ������������ "0 missingnasuffix missingNASuffix�� (0 missingnadelimiter missingNADelimiter�� 0 suffixtostrip suffixToStrip�� 0 suffixlength suffixLength
�� .aevtoappnull  �   � **** e � g g   M i s s i n g   N A��  f �� h���� i j��
�� .aevtoappnull  �   � **** h k     � k k  !����  ��  ��   i ���� 0 anitem anItem j  `����������������������������������
�� 
docu
�� 
FCdw
�� 
FCcn
�� 
OTst
�� 
valL�� $0 theselecteditems theSelectedItems
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pnam
�� 
ctxt�� 0 newname newName
�� 
pcls
�� 
FCpr
�� FCPsFCPd
�� 
FCPs
�� 
FCcd�� �� ~*�k/ v*�k/ n*�,�-�,E�O a�[��l 	kh  � J*�,b   =*�,E[�\[Zk\Zib  k 2E�O�*�,FO*�,�  �*a ,FY 	e*a ,FY hU[OY��UUUascr  ��ޭ