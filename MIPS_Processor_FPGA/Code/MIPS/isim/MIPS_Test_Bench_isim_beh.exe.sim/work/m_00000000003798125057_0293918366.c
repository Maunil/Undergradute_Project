/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/cmp/Deep/Semester 3/CO/MIPS/AdderMIPS/MIPS/Jump_Control_Block.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {24U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {30U, 0U};
static unsigned int ng6[] = {31U, 0U};
static unsigned int ng7[] = {28U, 0U};
static unsigned int ng8[] = {29U, 0U};



static void Initial_31_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(31, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);

LAB1:    return;
}

static void Initial_32_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(32, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 2088);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Always_57_2(char *t0)
{
    char t4[8];
    char t15[8];
    char t37[8];
    char t48[8];
    char t52[8];
    char t68[8];
    char t76[8];
    char t114[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    int t100;
    int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t115;
    char *t116;
    char *t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;

LAB0:    t1 = (t0 + 3504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3824);
    *((int *)t2) = 1;
    t3 = (t0 + 3536);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(58, ng0);

LAB5:    xsi_set_current_line(66, ng0);
    t5 = (t0 + 1048U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 15);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 15);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 31U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 31U);
    t14 = ((char*)((ng3)));
    memset(t15, 0, 8);
    t16 = (t4 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB9;

LAB6:    if (t27 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t15) = 1;

LAB9:    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 15);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 15);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 31U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 31U);
    t6 = ((char*)((ng5)));
    memset(t15, 0, 8);
    t7 = (t4 + 4);
    t14 = (t6 + 4);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t6);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t7);
    t22 = *((unsigned int *)t14);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t7);
    t26 = *((unsigned int *)t14);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB17;

LAB14:    if (t27 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t15) = 1;

LAB17:    memset(t37, 0, 8);
    t17 = (t15 + 4);
    t32 = *((unsigned int *)t17);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t17) != 0)
        goto LAB20;

LAB21:    t31 = (t37 + 4);
    t41 = *((unsigned int *)t37);
    t42 = *((unsigned int *)t31);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB22;

LAB23:    memcpy(t76, t37, 8);

LAB24:    t108 = (t76 + 4);
    t109 = *((unsigned int *)t108);
    t110 = (~(t109));
    t111 = *((unsigned int *)t76);
    t112 = (t111 & t110);
    t113 = (t112 != 0);
    if (t113 > 0)
        goto LAB36;

LAB37:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 15);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 15);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 31U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 31U);
    t6 = ((char*)((ng6)));
    memset(t15, 0, 8);
    t7 = (t4 + 4);
    t14 = (t6 + 4);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t6);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t7);
    t22 = *((unsigned int *)t14);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t7);
    t26 = *((unsigned int *)t14);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB43;

LAB40:    if (t27 != 0)
        goto LAB42;

LAB41:    *((unsigned int *)t15) = 1;

LAB43:    memset(t37, 0, 8);
    t17 = (t15 + 4);
    t32 = *((unsigned int *)t17);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t17) != 0)
        goto LAB46;

LAB47:    t31 = (t37 + 4);
    t41 = *((unsigned int *)t37);
    t42 = *((unsigned int *)t31);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB48;

LAB49:    memcpy(t76, t37, 8);

LAB50:    t108 = (t76 + 4);
    t109 = *((unsigned int *)t108);
    t110 = (~(t109));
    t111 = *((unsigned int *)t76);
    t112 = (t111 & t110);
    t113 = (t112 != 0);
    if (t113 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 15);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 15);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 31U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 31U);
    t6 = ((char*)((ng7)));
    memset(t15, 0, 8);
    t7 = (t4 + 4);
    t14 = (t6 + 4);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t6);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t7);
    t22 = *((unsigned int *)t14);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t7);
    t26 = *((unsigned int *)t14);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB69;

LAB66:    if (t27 != 0)
        goto LAB68;

LAB67:    *((unsigned int *)t15) = 1;

LAB69:    memset(t37, 0, 8);
    t17 = (t15 + 4);
    t32 = *((unsigned int *)t17);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB70;

LAB71:    if (*((unsigned int *)t17) != 0)
        goto LAB72;

LAB73:    t31 = (t37 + 4);
    t41 = *((unsigned int *)t37);
    t42 = *((unsigned int *)t31);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB74;

LAB75:    memcpy(t76, t37, 8);

LAB76:    t108 = (t76 + 4);
    t109 = *((unsigned int *)t108);
    t110 = (~(t109));
    t111 = *((unsigned int *)t76);
    t112 = (t111 & t110);
    t113 = (t112 != 0);
    if (t113 > 0)
        goto LAB88;

LAB89:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 15);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 15);
    *((unsigned int *)t2) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 31U);
    t13 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t13 & 31U);
    t6 = ((char*)((ng8)));
    memset(t15, 0, 8);
    t7 = (t4 + 4);
    t14 = (t6 + 4);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t6);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t7);
    t22 = *((unsigned int *)t14);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t7);
    t26 = *((unsigned int *)t14);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB95;

LAB92:    if (t27 != 0)
        goto LAB94;

LAB93:    *((unsigned int *)t15) = 1;

LAB95:    memset(t37, 0, 8);
    t17 = (t15 + 4);
    t32 = *((unsigned int *)t17);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB96;

LAB97:    if (*((unsigned int *)t17) != 0)
        goto LAB98;

LAB99:    t31 = (t37 + 4);
    t41 = *((unsigned int *)t37);
    t42 = *((unsigned int *)t31);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB100;

LAB101:    memcpy(t76, t37, 8);

LAB102:    t108 = (t76 + 4);
    t109 = *((unsigned int *)t108);
    t110 = (~(t109));
    t111 = *((unsigned int *)t76);
    t112 = (t111 & t110);
    t113 = (t112 != 0);
    if (t113 > 0)
        goto LAB114;

LAB115:    xsi_set_current_line(97, ng0);

LAB118:    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB116:
LAB90:
LAB64:
LAB38:
LAB12:    goto LAB2;

LAB8:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(67, ng0);

LAB13:    xsi_set_current_line(68, ng0);
    t38 = (t0 + 1048U);
    t39 = *((char **)t38);
    memset(t37, 0, 8);
    t38 = (t37 + 4);
    t40 = (t39 + 4);
    t41 = *((unsigned int *)t39);
    t42 = (t41 >> 0);
    *((unsigned int *)t37) = t42;
    t43 = *((unsigned int *)t40);
    t44 = (t43 >> 0);
    *((unsigned int *)t38) = t44;
    t45 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t45 & 255U);
    t46 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t46 & 255U);
    t47 = (t0 + 1928);
    xsi_vlogvar_assign_value(t47, t37, 0, 0, 8);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB12;

LAB16:    t16 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB17;

LAB18:    *((unsigned int *)t37) = 1;
    goto LAB21;

LAB20:    t30 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB21;

LAB22:    t38 = (t0 + 1368U);
    t39 = *((char **)t38);
    memset(t48, 0, 8);
    t38 = (t48 + 4);
    t40 = (t39 + 4);
    t44 = *((unsigned int *)t39);
    t45 = (t44 >> 1);
    t46 = (t45 & 1);
    *((unsigned int *)t48) = t46;
    t49 = *((unsigned int *)t40);
    t50 = (t49 >> 1);
    t51 = (t50 & 1);
    *((unsigned int *)t38) = t51;
    t47 = ((char*)((ng4)));
    memset(t52, 0, 8);
    t53 = (t48 + 4);
    t54 = (t47 + 4);
    t55 = *((unsigned int *)t48);
    t56 = *((unsigned int *)t47);
    t57 = (t55 ^ t56);
    t58 = *((unsigned int *)t53);
    t59 = *((unsigned int *)t54);
    t60 = (t58 ^ t59);
    t61 = (t57 | t60);
    t62 = *((unsigned int *)t53);
    t63 = *((unsigned int *)t54);
    t64 = (t62 | t63);
    t65 = (~(t64));
    t66 = (t61 & t65);
    if (t66 != 0)
        goto LAB28;

LAB25:    if (t64 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t52) = 1;

LAB28:    memset(t68, 0, 8);
    t69 = (t52 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t52);
    t73 = (t72 & t71);
    t74 = (t73 & 1U);
    if (t74 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t69) != 0)
        goto LAB31;

LAB32:    t77 = *((unsigned int *)t37);
    t78 = *((unsigned int *)t68);
    t79 = (t77 & t78);
    *((unsigned int *)t76) = t79;
    t80 = (t37 + 4);
    t81 = (t68 + 4);
    t82 = (t76 + 4);
    t83 = *((unsigned int *)t80);
    t84 = *((unsigned int *)t81);
    t85 = (t83 | t84);
    *((unsigned int *)t82) = t85;
    t86 = *((unsigned int *)t82);
    t87 = (t86 != 0);
    if (t87 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB24;

LAB27:    t67 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t67) = 1;
    goto LAB28;

LAB29:    *((unsigned int *)t68) = 1;
    goto LAB32;

LAB31:    t75 = (t68 + 4);
    *((unsigned int *)t68) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB32;

LAB33:    t88 = *((unsigned int *)t76);
    t89 = *((unsigned int *)t82);
    *((unsigned int *)t76) = (t88 | t89);
    t90 = (t37 + 4);
    t91 = (t68 + 4);
    t92 = *((unsigned int *)t37);
    t93 = (~(t92));
    t94 = *((unsigned int *)t90);
    t95 = (~(t94));
    t96 = *((unsigned int *)t68);
    t97 = (~(t96));
    t98 = *((unsigned int *)t91);
    t99 = (~(t98));
    t100 = (t93 & t95);
    t101 = (t97 & t99);
    t102 = (~(t100));
    t103 = (~(t101));
    t104 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t104 & t102);
    t105 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t105 & t103);
    t106 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t106 & t102);
    t107 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t107 & t103);
    goto LAB35;

LAB36:    xsi_set_current_line(72, ng0);

LAB39:    xsi_set_current_line(73, ng0);
    t115 = (t0 + 1048U);
    t116 = *((char **)t115);
    memset(t114, 0, 8);
    t115 = (t114 + 4);
    t117 = (t116 + 4);
    t118 = *((unsigned int *)t116);
    t119 = (t118 >> 0);
    *((unsigned int *)t114) = t119;
    t120 = *((unsigned int *)t117);
    t121 = (t120 >> 0);
    *((unsigned int *)t115) = t121;
    t122 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t122 & 255U);
    t123 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t123 & 255U);
    t124 = (t0 + 1928);
    xsi_vlogvar_assign_value(t124, t114, 0, 0, 8);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB38;

LAB42:    t16 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB43;

LAB44:    *((unsigned int *)t37) = 1;
    goto LAB47;

LAB46:    t30 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB47;

LAB48:    t38 = (t0 + 1368U);
    t39 = *((char **)t38);
    memset(t48, 0, 8);
    t38 = (t48 + 4);
    t40 = (t39 + 4);
    t44 = *((unsigned int *)t39);
    t45 = (t44 >> 1);
    t46 = (t45 & 1);
    *((unsigned int *)t48) = t46;
    t49 = *((unsigned int *)t40);
    t50 = (t49 >> 1);
    t51 = (t50 & 1);
    *((unsigned int *)t38) = t51;
    t47 = ((char*)((ng1)));
    memset(t52, 0, 8);
    t53 = (t48 + 4);
    t54 = (t47 + 4);
    t55 = *((unsigned int *)t48);
    t56 = *((unsigned int *)t47);
    t57 = (t55 ^ t56);
    t58 = *((unsigned int *)t53);
    t59 = *((unsigned int *)t54);
    t60 = (t58 ^ t59);
    t61 = (t57 | t60);
    t62 = *((unsigned int *)t53);
    t63 = *((unsigned int *)t54);
    t64 = (t62 | t63);
    t65 = (~(t64));
    t66 = (t61 & t65);
    if (t66 != 0)
        goto LAB54;

LAB51:    if (t64 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t52) = 1;

LAB54:    memset(t68, 0, 8);
    t69 = (t52 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t52);
    t73 = (t72 & t71);
    t74 = (t73 & 1U);
    if (t74 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t69) != 0)
        goto LAB57;

LAB58:    t77 = *((unsigned int *)t37);
    t78 = *((unsigned int *)t68);
    t79 = (t77 & t78);
    *((unsigned int *)t76) = t79;
    t80 = (t37 + 4);
    t81 = (t68 + 4);
    t82 = (t76 + 4);
    t83 = *((unsigned int *)t80);
    t84 = *((unsigned int *)t81);
    t85 = (t83 | t84);
    *((unsigned int *)t82) = t85;
    t86 = *((unsigned int *)t82);
    t87 = (t86 != 0);
    if (t87 == 1)
        goto LAB59;

LAB60:
LAB61:    goto LAB50;

LAB53:    t67 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t67) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t68) = 1;
    goto LAB58;

LAB57:    t75 = (t68 + 4);
    *((unsigned int *)t68) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB58;

LAB59:    t88 = *((unsigned int *)t76);
    t89 = *((unsigned int *)t82);
    *((unsigned int *)t76) = (t88 | t89);
    t90 = (t37 + 4);
    t91 = (t68 + 4);
    t92 = *((unsigned int *)t37);
    t93 = (~(t92));
    t94 = *((unsigned int *)t90);
    t95 = (~(t94));
    t96 = *((unsigned int *)t68);
    t97 = (~(t96));
    t98 = *((unsigned int *)t91);
    t99 = (~(t98));
    t100 = (t93 & t95);
    t101 = (t97 & t99);
    t102 = (~(t100));
    t103 = (~(t101));
    t104 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t104 & t102);
    t105 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t105 & t103);
    t106 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t106 & t102);
    t107 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t107 & t103);
    goto LAB61;

LAB62:    xsi_set_current_line(77, ng0);

LAB65:    xsi_set_current_line(78, ng0);
    t115 = (t0 + 1048U);
    t116 = *((char **)t115);
    memset(t114, 0, 8);
    t115 = (t114 + 4);
    t117 = (t116 + 4);
    t118 = *((unsigned int *)t116);
    t119 = (t118 >> 0);
    *((unsigned int *)t114) = t119;
    t120 = *((unsigned int *)t117);
    t121 = (t120 >> 0);
    *((unsigned int *)t115) = t121;
    t122 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t122 & 255U);
    t123 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t123 & 255U);
    t124 = (t0 + 1928);
    xsi_vlogvar_assign_value(t124, t114, 0, 0, 8);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB64;

LAB68:    t16 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB69;

LAB70:    *((unsigned int *)t37) = 1;
    goto LAB73;

LAB72:    t30 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB73;

LAB74:    t38 = (t0 + 1368U);
    t39 = *((char **)t38);
    memset(t48, 0, 8);
    t38 = (t48 + 4);
    t40 = (t39 + 4);
    t44 = *((unsigned int *)t39);
    t45 = (t44 >> 0);
    t46 = (t45 & 1);
    *((unsigned int *)t48) = t46;
    t49 = *((unsigned int *)t40);
    t50 = (t49 >> 0);
    t51 = (t50 & 1);
    *((unsigned int *)t38) = t51;
    t47 = ((char*)((ng4)));
    memset(t52, 0, 8);
    t53 = (t48 + 4);
    t54 = (t47 + 4);
    t55 = *((unsigned int *)t48);
    t56 = *((unsigned int *)t47);
    t57 = (t55 ^ t56);
    t58 = *((unsigned int *)t53);
    t59 = *((unsigned int *)t54);
    t60 = (t58 ^ t59);
    t61 = (t57 | t60);
    t62 = *((unsigned int *)t53);
    t63 = *((unsigned int *)t54);
    t64 = (t62 | t63);
    t65 = (~(t64));
    t66 = (t61 & t65);
    if (t66 != 0)
        goto LAB80;

LAB77:    if (t64 != 0)
        goto LAB79;

LAB78:    *((unsigned int *)t52) = 1;

LAB80:    memset(t68, 0, 8);
    t69 = (t52 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t52);
    t73 = (t72 & t71);
    t74 = (t73 & 1U);
    if (t74 != 0)
        goto LAB81;

LAB82:    if (*((unsigned int *)t69) != 0)
        goto LAB83;

LAB84:    t77 = *((unsigned int *)t37);
    t78 = *((unsigned int *)t68);
    t79 = (t77 & t78);
    *((unsigned int *)t76) = t79;
    t80 = (t37 + 4);
    t81 = (t68 + 4);
    t82 = (t76 + 4);
    t83 = *((unsigned int *)t80);
    t84 = *((unsigned int *)t81);
    t85 = (t83 | t84);
    *((unsigned int *)t82) = t85;
    t86 = *((unsigned int *)t82);
    t87 = (t86 != 0);
    if (t87 == 1)
        goto LAB85;

LAB86:
LAB87:    goto LAB76;

LAB79:    t67 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t67) = 1;
    goto LAB80;

LAB81:    *((unsigned int *)t68) = 1;
    goto LAB84;

LAB83:    t75 = (t68 + 4);
    *((unsigned int *)t68) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB84;

LAB85:    t88 = *((unsigned int *)t76);
    t89 = *((unsigned int *)t82);
    *((unsigned int *)t76) = (t88 | t89);
    t90 = (t37 + 4);
    t91 = (t68 + 4);
    t92 = *((unsigned int *)t37);
    t93 = (~(t92));
    t94 = *((unsigned int *)t90);
    t95 = (~(t94));
    t96 = *((unsigned int *)t68);
    t97 = (~(t96));
    t98 = *((unsigned int *)t91);
    t99 = (~(t98));
    t100 = (t93 & t95);
    t101 = (t97 & t99);
    t102 = (~(t100));
    t103 = (~(t101));
    t104 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t104 & t102);
    t105 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t105 & t103);
    t106 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t106 & t102);
    t107 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t107 & t103);
    goto LAB87;

LAB88:    xsi_set_current_line(82, ng0);

LAB91:    xsi_set_current_line(83, ng0);
    t115 = (t0 + 1048U);
    t116 = *((char **)t115);
    memset(t114, 0, 8);
    t115 = (t114 + 4);
    t117 = (t116 + 4);
    t118 = *((unsigned int *)t116);
    t119 = (t118 >> 0);
    *((unsigned int *)t114) = t119;
    t120 = *((unsigned int *)t117);
    t121 = (t120 >> 0);
    *((unsigned int *)t115) = t121;
    t122 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t122 & 255U);
    t123 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t123 & 255U);
    t124 = (t0 + 1928);
    xsi_vlogvar_assign_value(t124, t114, 0, 0, 8);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB90;

LAB94:    t16 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB95;

LAB96:    *((unsigned int *)t37) = 1;
    goto LAB99;

LAB98:    t30 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB99;

LAB100:    t38 = (t0 + 1368U);
    t39 = *((char **)t38);
    memset(t48, 0, 8);
    t38 = (t48 + 4);
    t40 = (t39 + 4);
    t44 = *((unsigned int *)t39);
    t45 = (t44 >> 0);
    t46 = (t45 & 1);
    *((unsigned int *)t48) = t46;
    t49 = *((unsigned int *)t40);
    t50 = (t49 >> 0);
    t51 = (t50 & 1);
    *((unsigned int *)t38) = t51;
    t47 = ((char*)((ng1)));
    memset(t52, 0, 8);
    t53 = (t48 + 4);
    t54 = (t47 + 4);
    t55 = *((unsigned int *)t48);
    t56 = *((unsigned int *)t47);
    t57 = (t55 ^ t56);
    t58 = *((unsigned int *)t53);
    t59 = *((unsigned int *)t54);
    t60 = (t58 ^ t59);
    t61 = (t57 | t60);
    t62 = *((unsigned int *)t53);
    t63 = *((unsigned int *)t54);
    t64 = (t62 | t63);
    t65 = (~(t64));
    t66 = (t61 & t65);
    if (t66 != 0)
        goto LAB106;

LAB103:    if (t64 != 0)
        goto LAB105;

LAB104:    *((unsigned int *)t52) = 1;

LAB106:    memset(t68, 0, 8);
    t69 = (t52 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t52);
    t73 = (t72 & t71);
    t74 = (t73 & 1U);
    if (t74 != 0)
        goto LAB107;

LAB108:    if (*((unsigned int *)t69) != 0)
        goto LAB109;

LAB110:    t77 = *((unsigned int *)t37);
    t78 = *((unsigned int *)t68);
    t79 = (t77 & t78);
    *((unsigned int *)t76) = t79;
    t80 = (t37 + 4);
    t81 = (t68 + 4);
    t82 = (t76 + 4);
    t83 = *((unsigned int *)t80);
    t84 = *((unsigned int *)t81);
    t85 = (t83 | t84);
    *((unsigned int *)t82) = t85;
    t86 = *((unsigned int *)t82);
    t87 = (t86 != 0);
    if (t87 == 1)
        goto LAB111;

LAB112:
LAB113:    goto LAB102;

LAB105:    t67 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t67) = 1;
    goto LAB106;

LAB107:    *((unsigned int *)t68) = 1;
    goto LAB110;

LAB109:    t75 = (t68 + 4);
    *((unsigned int *)t68) = 1;
    *((unsigned int *)t75) = 1;
    goto LAB110;

LAB111:    t88 = *((unsigned int *)t76);
    t89 = *((unsigned int *)t82);
    *((unsigned int *)t76) = (t88 | t89);
    t90 = (t37 + 4);
    t91 = (t68 + 4);
    t92 = *((unsigned int *)t37);
    t93 = (~(t92));
    t94 = *((unsigned int *)t90);
    t95 = (~(t94));
    t96 = *((unsigned int *)t68);
    t97 = (~(t96));
    t98 = *((unsigned int *)t91);
    t99 = (~(t98));
    t100 = (t93 & t95);
    t101 = (t97 & t99);
    t102 = (~(t100));
    t103 = (~(t101));
    t104 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t104 & t102);
    t105 = *((unsigned int *)t82);
    *((unsigned int *)t82) = (t105 & t103);
    t106 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t106 & t102);
    t107 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t107 & t103);
    goto LAB113;

LAB114:    xsi_set_current_line(87, ng0);

LAB117:    xsi_set_current_line(88, ng0);
    t115 = (t0 + 1048U);
    t116 = *((char **)t115);
    memset(t114, 0, 8);
    t115 = (t114 + 4);
    t117 = (t116 + 4);
    t118 = *((unsigned int *)t116);
    t119 = (t118 >> 0);
    *((unsigned int *)t114) = t119;
    t120 = *((unsigned int *)t117);
    t121 = (t120 >> 0);
    *((unsigned int *)t115) = t121;
    t122 = *((unsigned int *)t114);
    *((unsigned int *)t114) = (t122 & 255U);
    t123 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t123 & 255U);
    t124 = (t0 + 1928);
    xsi_vlogvar_assign_value(t124, t114, 0, 0, 8);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB116;

}


extern void work_m_00000000003798125057_0293918366_init()
{
	static char *pe[] = {(void *)Initial_31_0,(void *)Initial_32_1,(void *)Always_57_2};
	xsi_register_didat("work_m_00000000003798125057_0293918366", "isim/MIPS_Test_Bench_isim_beh.exe.sim/work/m_00000000003798125057_0293918366.didat");
	xsi_register_executes(pe);
}
