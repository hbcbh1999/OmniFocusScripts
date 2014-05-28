FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
+
%
	This script scans all projects and action groups in the front OmniFocus document identifying any that
	lack a next action.
	
	by Curt Clifton
	
	Copyright � 2007-2014, Curtis Clifton
	
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	verison 1.0: Updated for OmniFocus 2:
				� Added property to control whether single action lists are searched
				� Approximately twice as fast!
				� Uses Notification Center
				� Offers to reveal the projects and action groups that are missing next actions
				� Running the script again after added actions (or marking items completed) clears the �(missing next action)� suffix
				� Better error reporting
	version 0.5.1: Added a script to remove suffix to the package
	version 0.5: Move tag string to be a suffix rather than a prefix
	version 0.4.1: Removed sometimes-problematic use of 'activate' command
	version 0.4: Doesn't flag singleton holding projects as missing next actions even if they are empty
	version 0.3: Limited list of next-action-lacking projects in the dialog to 10.  More than 10 results in a dialog giving the number of such projects (along with the usual identifying-string instructions from the previous release).
	version 0.2: Added identifying string to offending projects based on idea from spiralocean.  Fixed bug where top-level projects without any actions were omitted.
	version 0.1: Original release
     � 	 	J 
 	 T h i s   s c r i p t   s c a n s   a l l   p r o j e c t s   a n d   a c t i o n   g r o u p s   i n   t h e   f r o n t   O m n i F o c u s   d o c u m e n t   i d e n t i f y i n g   a n y   t h a t 
 	 l a c k   a   n e x t   a c t i o n . 
 	 
 	 b y   C u r t   C l i f t o n 
 	 
 	 C o p y r i g h t   �   2 0 0 7 - 2 0 1 4 ,   C u r t i s   C l i f t o n 
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
 	 v e r i s o n   1 . 0 :   U p d a t e d   f o r   O m n i F o c u s   2 : 
 	 	 	 	 "   A d d e d   p r o p e r t y   t o   c o n t r o l   w h e t h e r   s i n g l e   a c t i o n   l i s t s   a r e   s e a r c h e d 
 	 	 	 	 "   A p p r o x i m a t e l y   t w i c e   a s   f a s t ! 
 	 	 	 	 "   U s e s   N o t i f i c a t i o n   C e n t e r 
 	 	 	 	 "   O f f e r s   t o   r e v e a l   t h e   p r o j e c t s   a n d   a c t i o n   g r o u p s   t h a t   a r e   m i s s i n g   n e x t   a c t i o n s 
 	 	 	 	 "   R u n n i n g   t h e   s c r i p t   a g a i n   a f t e r   a d d e d   a c t i o n s   ( o r   m a r k i n g   i t e m s   c o m p l e t e d )   c l e a r s   t h e    ( m i s s i n g   n e x t   a c t i o n )    s u f f i x 
 	 	 	 	 "   B e t t e r   e r r o r   r e p o r t i n g 
 	 v e r s i o n   0 . 5 . 1 :   A d d e d   a   s c r i p t   t o   r e m o v e   s u f f i x   t o   t h e   p a c k a g e 
 	 v e r s i o n   0 . 5 :   M o v e   t a g   s t r i n g   t o   b e   a   s u f f i x   r a t h e r   t h a n   a   p r e f i x 
 	 v e r s i o n   0 . 4 . 1 :   R e m o v e d   s o m e t i m e s - p r o b l e m a t i c   u s e   o f   ' a c t i v a t e '   c o m m a n d 
 	 v e r s i o n   0 . 4 :   D o e s n ' t   f l a g   s i n g l e t o n   h o l d i n g   p r o j e c t s   a s   m i s s i n g   n e x t   a c t i o n s   e v e n   i f   t h e y   a r e   e m p t y 
 	 v e r s i o n   0 . 3 :   L i m i t e d   l i s t   o f   n e x t - a c t i o n - l a c k i n g   p r o j e c t s   i n   t h e   d i a l o g   t o   1 0 .     M o r e   t h a n   1 0   r e s u l t s   i n   a   d i a l o g   g i v i n g   t h e   n u m b e r   o f   s u c h   p r o j e c t s   ( a l o n g   w i t h   t h e   u s u a l   i d e n t i f y i n g - s t r i n g   i n s t r u c t i o n s   f r o m   t h e   p r e v i o u s   r e l e a s e ) . 
 	 v e r s i o n   0 . 2 :   A d d e d   i d e n t i f y i n g   s t r i n g   t o   o f f e n d i n g   p r o j e c t s   b a s e d   o n   i d e a   f r o m   s p i r a l o c e a n .     F i x e d   b u g   w h e r e   t o p - l e v e l   p r o j e c t s   w i t h o u t   a n y   a c t i o n s   w e r e   o m i t t e d . 
 	 v e r s i o n   0 . 1 :   O r i g i n a l   r e l e a s e 
   
  
 l     ��������  ��  ��        j     �� �� <0 shouldchecksingleactionlists shouldCheckSingleActionLists  m     ��
�� boovfals      j    �� �� *0 lackinglistingdelim lackingListingDelim  l    ����  b        o    ��
�� 
ret   m       �            "  ��  ��        j    
�� �� "0 missingnasuffix missingNASuffix  m    	   �   * ( m i s s i n g   n e x t   a c t i o n )      j    �� �� (0 missingnadelimiter missingNADelimiter  m       �          ! " ! l     ��������  ��  ��   "  # $ # l      �� % &��   % D >
	The following properties are used for script notifications.
    & � ' ' | 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   s c r i p t   n o t i f i c a t i o n s . 
 $  ( ) ( j    �� *�� "0 scriptsuitename scriptSuiteName * m     + + � , ,  C u r t  s   S c r i p t s )  - . - l     ��������  ��  ��   .  / 0 / l     1���� 1 n     2 3 2 I    �� 4���� 
0 notify   4  5 6 5 m     7 7 � 8 8 2 C h e c k i n g   f o r   N e x t   A c t i o n s 6  9�� 9 m     : : � ; ; � S c a n n i n g   a l l   p r o j e c t s   a n d   a c t i o n   g r o u p s   f o r   a n y   t h a t   l a c k   a   n e x t   a c t i o n��  ��   3  f     ��  ��   0  < = < l  � >���� > O   � ? @ ? O   � A B A k   � C C  D E D n    F G F I    �� H����  0 removesuffixes removeSuffixes H  I�� I  g    ��  ��   G  f     E  J K J r    ( L M L n   & N O N I    &�� P���� ,0 accumulatemissingnas accumulateMissingNAs P  Q R Q  g      R  S�� S J     "����  ��  ��   O  f     M o      ���� (0 lackingnextactions lackingNextActions K  T�� T Z   )� U V�� W U l  ) - X���� X =  ) - Y Z Y o   ) *���� (0 lackingnextactions lackingNextActions Z J   * ,����  ��  ��   V k   0 I [ [  \ ] \ Z   0 A ^ _�� ` ^ o   0 5���� <0 shouldchecksingleactionlists shouldCheckSingleActionLists _ r   8 ; a b a m   8 9 c c � d d � N e x t   a c t i o n s   a r e   i d e n t i f i e d   f o r   a l l   a c t i v e   p r o j e c t s ,   a c t i o n   g r o u p s ,   a n d   s i n g l e   a c t i o n   l i s t s . b o      ���� 0 msg  ��   ` r   > A e f e m   > ? g g � h h � N e x t   a c t i o n s   a r e   i d e n t i f i e d   f o r   a l l   a c t i v e   p r o j e c t s   a n d   a c t i o n   g r o u p s . f o      ���� 0 msg   ]  i�� i n  B I j k j I   C I�� l���� 
0 notify   l  m n m m   C D o o � p p   C o n g r a t u l a t i o n s ! n  q�� q o   D E���� 0 msg  ��  ��   k  f   B C��  ��   W k   L� r r  s t s r   L O u v u m   L M w w � x x � S o m e   a c t i v e   p r o j e c t s   o r   a c t i o n   g r o u p s   a r e   m i s s i n g   n e x t   a c t i o n s .   Y o u   c a n   r e v e a l   t h e m   i f   y o u   w a n t   t o   c o r r e c t   t h i s . v o      ���� 0 	titletext 	titleText t  y z y r   P W { | { m   P S } } � ~ ~ 
 i t e m s | o      ���� "0 pluralizeditems pluralizedItems z   �  Z   X � � � � � � l  X _ ����� � =  X _ � � � l  X ] ����� � I  X ]�� ���
�� .corecnte****       **** � o   X Y���� (0 lackingnextactions lackingNextActions��  ��  ��   � m   ] ^���� ��  ��   � k   b � � �  � � � r   b g � � � m   b e � � � � � � A n   a c t i v e   p r o j e c t   o r   a c t i o n   g r o u p   i s   m i s s i n g   a   n e x t   a c t i o n .   Y o u   c a n   r e v e a l   i t   i f   y o u   w a n t   t o   c o r r e c t   t h i s . � o      ���� 0 	titletext 	titleText �  � � � r   h x � � � b   h v � � � b   h r � � � m   h k � � � � � : T h e r e   i s   n o   n e x t   a c t i o n   f o r    � n   k q � � � 4   l q�� �
�� 
cobj � m   o p����  � o   k l���� (0 lackingnextactions lackingNextActions � m   r u � � � � �   .   � o      ���� 0 msg   �  ��� � r   y � � � � m   y | � � � � �  i t e m � o      ���� "0 pluralizeditems pluralizedItems��   �  � � � l  � � ����� � ?   � � � � � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � o   � ����� (0 lackingnextactions lackingNextActions��  ��  ��   � m   � ����� 
��  ��   �  ��� � r   � � � � � b   � � � � � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � o   � ����� (0 lackingnextactions lackingNextActions��  ��  ��   � m   � � � � � � � t   a c t i v e   p r o j e c t s   o r   a c t i o n   g r o u p s   d o   n o t   h a v e   n e x t   a c t i o n s � o      ���� 0 msg  ��   � k   � � � �  � � � r   � � � � � n  � � � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr � o      ���� 0 olddelim oldDelim �  � � � r   � � � � � o   � ����� *0 lackinglistingdelim lackingListingDelim � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  � � � r   � � � � � l  � � ����� � c   � � � � � o   � ����� (0 lackingnextactions lackingNextActions � m   � ���
�� 
ctxt��  ��   � o      ����  0 lackinglisting lackingListing �  � � � r   � � � � � o   � ����� 0 olddelim oldDelim � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  ��� � r   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � � T h e s e   a c t i v e   p r o j e c t s   o r   a c t i o n   g r o u p s   d o   n o t   h a v e   n e x t   a c t i o n s : � o   � ����� *0 lackinglistingdelim lackingListingDelim � o   � �����  0 lackinglisting lackingListing � o   � ���
�� 
ret  � o      ���� 0 msg  ��   �  � � � r   � � � � I  ��� � �
�� .sysodisAaleR        TEXT � o   � ����� 0 	titletext 	titleText � �� � �
�� 
mesS � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 msg   � m   � � � � � � �  M a r k   t h e   � o   � ����� "0 pluralizeditems pluralizedItems � m   � � � � � � � �   a s   c o m p l e t e d ,   o r   a d d   a c t i o n s   a s   n e e d e d   a n d   r e - r u n   t h i s   s c r i p t   t o   r e m o v e   t h e    � o   � ����� "0 missingnasuffix missingNASuffix � m   � � � � � � �     s u f f i x . � �� � �
�� 
btns � J   � � �  � � � m   � � � � � �  O K �  ��� � m   � � � � �  R e v e a l��   � �� � �
�� 
dflt � m  
����  � �� ���
�� 
cbtn � m  ���� ��   � o      ���� 0 alertresult alertResult �  ��� � Z  � ����  l %���� = % n  ! 1  !��
�� 
bhit o  ���� 0 alertresult alertResult m  !$ �  R e v e a l��  ��   k  (�		 

 r  (F I (B����
�� .corecrel****      � null��   ��
�� 
kocl m  ,/��
�� 
FCdw ���
�� 
insh n  2< 8  8<�~
�~ 
insl 4 28�}
�} 
FCdw m  67�|�| �   o      �{�{ 0 awindow aWindow �z O  G� k  M�  r  MV m  MP�y
�y FCsbFCT1 1  PU�x
�x 
FCST  r  Wh  m  WZ�w
�w savono    n      !"! 1  cg�v
�v 
OTs?" n  Zc#$# 2  _c�u
�u 
OTds$ 1  Z_�t
�t 
FCSt %&% r  iv'(' m  il)) �**  i n c o m p l e t e( n      +,+ 1  qu�s
�s 
FC?i, 1  lq�r
�r 
FCcn& -.- r  w�/0/ 1  w|�q
�q 
FC~=0 o      �p�p &0 currentsearchterm currentSearchTerm. 1�o1 Z  ��23�n42 l ��5�m�l5 = ��676 o  ���k�k &0 currentsearchterm currentSearchTerm7 m  ���j
�j 
msng�m  �l  3 I ���i89
�i .sysodisAaleR        TEXT8 m  ��:: �;; � T h e   m i s s i n g   a c t i o n s   c a n n o t   b e   r e v e a l e d   w i t h o u t   h a v i n g   t h e   S e a r c h   f i e l d   i n   t h e   t o o l b a r .9 �h<=
�h 
mesS< m  ��>> �??b T o   a d d   t h e   S e a r c h   f i e l d ,   c o n t r o l - c l i c k   o n   t h e   t o o l b a r ,   c h o o s e    C u s t o m i z e   T o o l b a r &  ,   a n d   d r a g   t h e   S e a r c h   f i e l d   o n t o   t h e   t o o l b a r .   R e - r u n   t h i s   s c r i p t   t o   r e v e a l   t h e   m i s s i n g   a c t i o n s .= �g@�f
�g 
btns@ J  ��AA B�eB m  ��CC �DD  O K�e  �f  �n  4 r  ��EFE m  ��GG �HH * ( m i s s i n g   n e x t   a c t i o n )F 1  ���d
�d 
FC~=�o   o  GJ�c�c 0 awindow aWindow�z  ��  ��  ��  ��   B 4   �bI
�b 
docuI m    �a�a  @ 5    �`J�_
�` 
cappJ m   
 KK �LL 0 c o m . o m n i g r o u p . O m n i F o c u s 2
�_ kfrmID  ��  ��   = MNM l     �^�]�\�^  �]  �\  N OPO l      �[QR�[  Q	 
	Accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theContainer: a document or folder containing flattened projects
	accum: the items lacking next actions that have been found so far 
   R �SS   
 	 A c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e C o n t a i n e r :   a   d o c u m e n t   o r   f o l d e r   c o n t a i n i n g   f l a t t e n e d   p r o j e c t s 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
P TUT i    VWV I      �ZX�Y�Z ,0 accumulatemissingnas accumulateMissingNAsX YZY o      �X�X 0 thecontainer theContainerZ [�W[ o      �V�V 	0 accum  �W  �Y  W k     C\\ ]^] I    �U_�T
�U .ascrcmnt****      � ****_ o     �S�S 0 thecontainer theContainer�T  ^ `�R` w    Caba k    Ccc ded Z    9fg�Qhf o    �P�P <0 shouldchecksingleactionlists shouldCheckSingleActionListsg r    iji 6   klk n    mnm 2    �O
�O 
FCfxn o    �N�N 0 thecontainer theContainerl =   opo 1    �M
�M 
FCPsp m    �L
�L FCPsFCPaj o      �K�K 0 theprojects theProjects�Q  h r   ! 9qrq 6  ! 7sts n   ! $uvu 2   " $�J
�J 
FCfxv o   ! "�I�I 0 thecontainer theContainert F   % 6wxw =  & -yzy 1   ' )�H
�H 
FCPsz m   * ,�G
�G FCPsFCPax =  . 5{|{ 1   / 1�F
�F 
FC.A| m   2 4�E
�E boovfalsr o      �D�D 0 theprojects theProjectse }�C} r   : C~~ n  : A��� I   ; A�B��A�B <0 accumulatemissingnasprojects accumulateMissingNAsProjects� ��� o   ; <�@�@ 0 theprojects theProjects� ��?� o   < =�>�> 	0 accum  �?  �A  �  f   : ; o      �=�= 	0 accum  �C  b�                                                                                  OFOC  alis    X  Macintosh HD               �Ȗ�H+   �G�OmniFocus.app                                                  x	�ϛ��        ����  	                Applications    ���*      ϜGV     �G�  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  �R  U ��� l     �<�;�:�<  �;  �:  � ��� l      �9���9  �$ 
	Recurses over the trees rooted at the given projects, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theProjects: a list of projects
	accum: the items lacking next actions that have been found so far 
   � ���<   
 	 R e c u r s e s   o v e r   t h e   t r e e s   r o o t e d   a t   t h e   g i v e n   p r o j e c t s ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e P r o j e c t s :   a   l i s t   o f   p r o j e c t s 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
� ��� i    ��� I      �8��7�8 <0 accumulatemissingnasprojects accumulateMissingNAsProjects� ��� o      �6�6 0 theprojects theProjects� ��5� o      �4�4 	0 accum  �5  �7  � k     ^�� ��� w     [��� X    [��3�� k    V�� ��� I   �2��1
�2 .ascrcmnt****      � ****� b    ��� m    �� ��� $ C h e c k i n g   p r o j e c t :  � l   ��0�/� n    ��� 1    �.
�. 
pnam� o    �-�- 0 aproject aProject�0  �/  �1  � ��� r    !��� n    ��� 1    �,
�, 
ctnr� o    �+�+ 0 aproject aProject� o      �*�* $0 projectcontainer projectContainer� ��)� Z   " V���(�� l  " ;��'�&� G   " ;��� >  " '��� n   " %��� m   # %�%
�% 
pcls� o   " #�$�$ $0 projectcontainer projectContainer� m   % &�#
�# 
FCAr� l  * 9��"�!� F   * 9��� =  * /��� n   * -��� m   + -� 
�  
pcls� o   * +�� $0 projectcontainer projectContainer� m   - .�
� 
FCAr� >  2 7��� n   2 5��� 1   3 5�
� 
FCHi� o   2 3�� $0 projectcontainer projectContainer� m   5 6�
� boovtrue�"  �!  �'  �&  � k   > N�� ��� r   > C��� n   > A��� 1   ? A�
� 
FCrt� o   > ?�� 0 aproject aProject� o      �� 0 theroottask theRootTask� ��� r   D N��� n  D L��� I   E L���� 40 accumulatemissingnastask accumulateMissingNAsTask� ��� o   E F�� 0 theroottask theRootTask� ��� m   F G�
� boovtrue� ��� o   G H�� 	0 accum  �  �  �  f   D E� o      �� 	0 accum  �  �(  � I  Q V���
� .ascrcmnt****      � ****� m   Q R�� ���  s k i p p e d�  �)  �3 0 aproject aProject� o    �� 0 theprojects theProjects��                                                                                  OFOC  alis    X  Macintosh HD               �Ȗ�H+   �G�OmniFocus.app                                                  x	�ϛ��        ����  	                Applications    ���*      ϜGV     �G�  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  � ��� L   \ ^�� o   \ ]�� 	0 accum  �  � ��� l     �
�	��
  �	  �  � ��� l      ����  �NH 
	Recurses over the tree rooted at the given task, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theTask: a task
	isProjectRoot: true iff theTask is the root task of a project
	accum: the items lacking next actions that have been found so far 
   � ����   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   t a s k ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e T a s k :   a   t a s k 
 	 i s P r o j e c t R o o t :   t r u e   i f f   t h e T a s k   i s   t h e   r o o t   t a s k   o f   a   p r o j e c t 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
� ��� i    ��� I      ���� 40 accumulatemissingnastask accumulateMissingNAsTask� ��� o      �� 0 thetask theTask� ��� o      �� 0 isprojectroot isProjectRoot� ��� o      �� 	0 accum  �  �  � w     ���� O    ���� k    ��� ��� r    ��� G    ��� o    � �  0 isprojectroot isProjectRoot� ?   
 ��� l  
 ������ I  
 �����
�� .corecnte****       ****� l  
 ������ e   
 �� 2  
 ��
�� 
FCac��  ��  ��  ��  ��  � m    ����  � o      ���� 80 isaprojectorsubprojecttask isAProjectOrSubprojectTask� ��� Z   -������� l   $ ����  G    $ 1    ��
�� 
FCcd H     " o     !���� 80 isaprojectorsubprojecttask isAProjectOrSubprojectTask��  ��  � L   ' ) o   ' (���� 	0 accum  ��  ��  �  r   . < 6  . :	
	 2   . 1��
�� 
FCac
 =  2 9 1   3 5��
�� 
FCcd m   6 8��
�� boovfals o      ���� ,0 incompletechildtasks incompleteChildTasks �� Z   = ��� l  = D���� =  = D l  = B���� I  = B����
�� .corecnte****       **** o   = >���� ,0 incompletechildtasks incompleteChildTasks��  ��  ��   m   B C����  ��  ��   k   G u  r   G M 1   G J��
�� 
pnam n        ;   K L o   J K���� 	0 accum    l  N N�� ��   � � The following idea of tagging the items with an identifying string is due to user spiralocean on the OmniFocus Extras forum at OmniGroup.com:     �!!   T h e   f o l l o w i n g   i d e a   o f   t a g g i n g   t h e   i t e m s   w i t h   a n   i d e n t i f y i n g   s t r i n g   i s   d u e   t o   u s e r   s p i r a l o c e a n   o n   t h e   O m n i F o c u s   E x t r a s   f o r u m   a t   O m n i G r o u p . c o m : "#" Z   N r$%����$ l  N X&����& H   N X'' D   N W()( 1   N Q��
�� 
pnam) o   Q V���� "0 missingnasuffix missingNASuffix��  ��  % r   [ n*+* l  [ j,����, b   [ j-.- b   [ d/0/ 1   [ ^��
�� 
pnam0 o   ^ c���� (0 missingnadelimiter missingNADelimiter. o   d i���� "0 missingnasuffix missingNASuffix��  ��  + 1   j m��
�� 
pnam��  ��  # 1��1 L   s u22 o   s t���� 	0 accum  ��  ��   L   x �33 n  x 454 I   y ��6���� 60 accumulatemissingnastasks accumulateMissingNAsTasks6 787 o   y z���� ,0 incompletechildtasks incompleteChildTasks8 9��9 o   z {���� 	0 accum  ��  ��  5  f   x y��  � o    ���� 0 thetask theTask��                                                                                  OFOC  alis    X  Macintosh HD               �Ȗ�H+   �G�OmniFocus.app                                                  x	�ϛ��        ����  	                Applications    ���*      ϜGV     �G�  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  � :;: l     ��������  ��  ��  ; <=< l      ��>?��  >A; 
	Recurses over the trees rooted at the given tasks, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theTasks: a list of tasks, none of which are project root tasks
	accum: the items lacking next actions that have been found so far 
   ? �@@v   
 	 R e c u r s e s   o v e r   t h e   t r e e s   r o o t e d   a t   t h e   g i v e n   t a s k s ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e T a s k s :   a   l i s t   o f   t a s k s ,   n o n e   o f   w h i c h   a r e   p r o j e c t   r o o t   t a s k s 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
= ABA i     CDC I      ��E���� 60 accumulatemissingnastasks accumulateMissingNAsTasksE FGF o      ���� 0 thetasks theTasksG H��H o      ���� 	0 accum  ��  ��  D k     $II JKJ w     !LML X    !N��ON r    PQP n   RSR I    ��T���� 40 accumulatemissingnastask accumulateMissingNAsTaskT UVU o    ���� 0 atask aTaskV WXW m    ��
�� boovfalsX Y��Y o    ���� 	0 accum  ��  ��  S  f    Q o      ���� 	0 accum  �� 0 atask aTaskO o    ���� 0 thetasks theTasksM�                                                                                  OFOC  alis    X  Macintosh HD               �Ȗ�H+   �G�OmniFocus.app                                                  x	�ϛ��        ����  	                Applications    ���*      ϜGV     �G�  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  K Z��Z L   " $[[ o   " #���� 	0 accum  ��  B \]\ l     ��������  ��  ��  ] ^_^ l      ��`a��  ` p j
	Removes "missing next action" suffixes from all tasks and projects.
	theDocument: an OmniFocus document
   a �bb � 
 	 R e m o v e s   " m i s s i n g   n e x t   a c t i o n "   s u f f i x e s   f r o m   a l l   t a s k s   a n d   p r o j e c t s . 
 	 t h e D o c u m e n t :   a n   O m n i F o c u s   d o c u m e n t 
_ cdc i   ! $efe I      ��g����  0 removesuffixes removeSuffixesg h��h o      ���� 0 thedocument theDocument��  ��  f w     qiji k    qkk lml r    non 6   pqp n    rsr 2    ��
�� 
FCfts o    ���� 0 thedocument theDocumentq D    tut 1    	��
�� 
pnamu o   
 ���� "0 missingnasuffix missingNASuffixo o      ���� 0 thetasks theTasksm v��v X    qw��xw k   % lyy z{z r   % *|}| n   % (~~ 1   & (��
�� 
pnam o   % &���� 0 atask aTask} o      ���� 0 newname newName{ ��� r   + A��� n   + ?��� 7  , ?����
�� 
ctxt� m   0 2���� � d   3 >�� l  4 =������ [   4 =��� m   4 5���� � l  5 <������ n   5 <��� 1   : <��
�� 
leng� o   5 :���� "0 missingnasuffix missingNASuffix��  ��  ��  ��  � o   + ,���� 0 newname newName� o      ���� 0 newname newName� ��� Z   B f������� l  B I������ D   B I��� o   B C���� 0 newname newName� o   C H���� (0 missingnadelimiter missingNADelimiter��  ��  � r   L b��� n   L `��� 7  M `����
�� 
ctxt� m   Q S���� � d   T _�� l  U ^������ [   U ^��� m   U V���� � l  V ]������ n   V ]��� 1   [ ]��
�� 
leng� o   V [���� (0 missingnadelimiter missingNADelimiter��  ��  ��  ��  � o   L M���� 0 newname newName� o      ���� 0 newname newName��  ��  � ���� r   g l��� o   g h���� 0 newname newName� n      ��� 1   i k��
�� 
pnam� o   h i���� 0 atask aTask��  �� 0 atask aTaskx o    ���� 0 thetasks theTasks��  j�                                                                                  OFOC  alis    X  Macintosh HD               �Ȗ�H+   �G�OmniFocus.app                                                  x	�ϛ��        ����  	                Applications    ���*      ϜGV     �G�  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  d ��� l     ��������  ��  ��  � ��� l      ������  � � �
	Uses Notification Center to display a notification message.
	theTitle � a string giving the notification title
	theDescription � a string describing the notification event
   � ���\ 
 	 U s e s   N o t i f i c a t i o n   C e n t e r   t o   d i s p l a y   a   n o t i f i c a t i o n   m e s s a g e . 
 	 t h e T i t l e      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   t i t l e 
 	 t h e D e s c r i p t i o n      a   s t r i n g   d e s c r i b i n g   t h e   n o t i f i c a t i o n   e v e n t 
� ��� i   % (��� I      ���~� 
0 notify  � ��� o      �}�} 0 thetitle theTitle� ��|� o      �{�{  0 thedescription theDescription�|  �~  � I    �z��
�z .sysonotfnull��� ��� TEXT� o     �y�y  0 thedescription theDescription� �x��
�x 
appr� o    �w�w "0 scriptsuitename scriptSuiteName� �v��u
�v 
subt� o    	�t�t 0 thetitle theTitle�u  � ��s� l     �r�q�p�r  �q  �p  �s       �o��n�   +��������o  � �m�l�k�j�i�h�g�f�e�d�c�b�m <0 shouldchecksingleactionlists shouldCheckSingleActionLists�l *0 lackinglistingdelim lackingListingDelim�k "0 missingnasuffix missingNASuffix�j (0 missingnadelimiter missingNADelimiter�i "0 scriptsuitename scriptSuiteName�h ,0 accumulatemissingnas accumulateMissingNAs�g <0 accumulatemissingnasprojects accumulateMissingNAsProjects�f 40 accumulatemissingnastask accumulateMissingNAsTask�e 60 accumulatemissingnastasks accumulateMissingNAsTasks�d  0 removesuffixes removeSuffixes�c 
0 notify  
�b .aevtoappnull  �   � ****
�n boovfals� ���           "  � �aW�`�_���^�a ,0 accumulatemissingnas accumulateMissingNAs�` �]��] �  �\�[�\ 0 thecontainer theContainer�[ 	0 accum  �_  � �Z�Y�X�Z 0 thecontainer theContainer�Y 	0 accum  �X 0 theprojects theProjects� �Wb�V��U�T�S�R
�W .ascrcmnt****      � ****
�V 
FCfx�  
�U 
FCPs
�T FCPsFCPa
�S 
FC.A�R <0 accumulatemissingnasprojects accumulateMissingNAsProjects�^ D�j  O�Zb    ��-�[�,\Z�81E�Y ��-�[[�,\Z�8\[�,\Zf8A1E�O)��l+ E�� �Q��P�O���N�Q <0 accumulatemissingnasprojects accumulateMissingNAsProjects�P �M��M �  �L�K�L 0 theprojects theProjects�K 	0 accum  �O  � �J�I�H�G�F�J 0 theprojects theProjects�I 	0 accum  �H 0 aproject aProject�G $0 projectcontainer projectContainer�F 0 theroottask theRootTask� ��E�D�C��B�A�@�?�>�=�<�;�:�
�E 
kocl
�D 
cobj
�C .corecnte****       ****
�B 
pnam
�A .ascrcmnt****      � ****
�@ 
ctnr
�? 
pcls
�> 
FCAr
�= 
FCHi
�< 
bool
�; 
FCrt�: 40 accumulatemissingnastask accumulateMissingNAsTask�N _�Z X�[��l kh ��,%j O��,E�O��,�
 ��,� 	 	��,e�&�& ��,E�O)�e�m+ E�Y �j [OY��O�� �9��8�7���6�9 40 accumulatemissingnastask accumulateMissingNAsTask�8 �5��5 �  �4�3�2�4 0 thetask theTask�3 0 isprojectroot isProjectRoot�2 	0 accum  �7  � �1�0�/�.�-�1 0 thetask theTask�0 0 isprojectroot isProjectRoot�/ 	0 accum  �. 80 isaprojectorsubprojecttask isAProjectOrSubprojectTask�- ,0 incompletechildtasks incompleteChildTasks� ��,�+�*�)��(�'
�, 
FCac
�+ .corecnte****       ****
�* 
bool
�) 
FCcd
�( 
pnam�' 60 accumulatemissingnastasks accumulateMissingNAsTasks�6 ��Z� |�
 *�-Ej j�&E�O*�,E
 ��& �Y hO*�-�[�,\Zf81E�O�j j  3*�,�6FO*�,b   *�,b  %b  %*�,FY hO�Y 
)��l+ U� �&D�%�$���#�& 60 accumulatemissingnastasks accumulateMissingNAsTasks�% �"��" �  �!� �! 0 thetasks theTasks�  	0 accum  �$  � ���� 0 thetasks theTasks� 	0 accum  � 0 atask aTask� M����
� 
kocl
� 
cobj
� .corecnte****       ****� 40 accumulatemissingnastask accumulateMissingNAsTask�# %�Z �[��l kh )�f�m+ E�[OY��O�� �f������  0 removesuffixes removeSuffixes� ��� �  �� 0 thedocument theDocument�  � ����� 0 thedocument theDocument� 0 thetasks theTasks� 0 atask aTask� 0 newname newName� 	j������
�	�
� 
FCft
� 
pnam
� 
kocl
� 
cobj
�
 .corecnte****       ****
�	 
ctxt
� 
leng� r�Z��-�[�,\Zb  ?1E�O [�[��l kh ��,E�O�[�\[Zk\Zkb  �,'2E�O�b   �[�\[Zk\Zkb  �,'2E�Y hO���,F[OY��� �������� 
0 notify  � ��� �  ��� 0 thetitle theTitle�  0 thedescription theDescription�  � � ���  0 thetitle theTitle��  0 thedescription theDescription� ��������
�� 
appr
�� 
subt�� 
�� .sysonotfnull��� ��� TEXT� ��b  �� � �����������
�� .aevtoappnull  �   � ****� k    ���  /��  <����  ��  ��  �  � F 7 :����K���������� c�� g o w�� }���� � ��� � ��� ����������� ����� � � ��� � ���������������������������������������)����������:>CG�� 
0 notify  
�� 
capp
�� kfrmID  
�� 
docu��  0 removesuffixes removeSuffixes�� ,0 accumulatemissingnas accumulateMissingNAs�� (0 lackingnextactions lackingNextActions�� 0 msg  �� 0 	titletext 	titleText�� "0 pluralizeditems pluralizedItems
�� .corecnte****       ****
�� 
cobj�� 

�� 
ascr
�� 
txdl�� 0 olddelim oldDelim
�� 
ctxt��  0 lackinglisting lackingListing
�� 
ret 
�� 
mesS
�� 
btns
�� 
dflt
�� 
cbtn�� 
�� .sysodisAaleR        TEXT�� 0 alertresult alertResult
�� 
bhit
�� 
kocl
�� 
FCdw
�� 
insh
�� 
insl�� 
�� .corecrel****      � null�� 0 awindow aWindow
�� FCsbFCT1
�� 
FCST
�� savono  
�� 
FCSt
�� 
OTds
�� 
OTs?
�� 
FCcn
�� 
FC?i
�� 
FC~=�� &0 currentsearchterm currentSearchTerm
�� 
msng���)��l+ O)���0�*�k/�)*k+ O)*jvl+ E�O�jv  b    �E�Y �E�O)��l+ Yi�E�Oa E` O�j k  #a E�Oa �a k/%a %E�Oa E` Y _�j a  �j a %E�Y E_ a ,E` Ob  _ a ,FO�a &E` O_ _ a ,FOa b  %_ %_  %E�O�a !�a "%_ %a #%b  %a $%a %a &a 'lva (la )ka * +E` ,O_ ,a -,a .  �*a /a 0a 1*a 0k/a 23a 3 4E` 5O_ 5 ca 6*a 7,FOa 8*a 9,a :-a ;,FOa <*a =,a >,FO*a ?,E` @O_ @a A  a Ba !a Ca %a Dkva 3 +Y a E*a ?,FUY hUUascr  ��ޭ