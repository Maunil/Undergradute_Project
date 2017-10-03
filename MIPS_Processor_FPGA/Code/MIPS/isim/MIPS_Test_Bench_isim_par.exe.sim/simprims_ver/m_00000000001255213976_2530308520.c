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



static void Gate_29_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 2504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1344U);
    t3 = *((char **)t2);
    t2 = (t0 + 2904);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 2904);
    xsi_driver_vfirst_trans(t8, 0, 0);
    t9 = (t0 + 2824);
    *((int *)t9) = 1;

LAB1:    return;
}


extern void simprims_ver_m_00000000001255213976_2530308520_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_2530308520", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_2530308520.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0294086961_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0294086961", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0294086961.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_1567299789_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_1567299789", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_1567299789.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0453576746_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0453576746", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0453576746.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_2266766175_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_2266766175", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_2266766175.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_1410002631_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_1410002631", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_1410002631.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_3377491514_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_3377491514", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_3377491514.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_3330364853_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_3330364853", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_3330364853.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0282637992_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0282637992", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0282637992.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0479025481_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0479025481", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0479025481.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_3832421105_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_3832421105", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_3832421105.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_3407269987_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_3407269987", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_3407269987.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0440834978_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0440834978", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0440834978.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0491729790_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0491729790", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0491729790.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_3385483281_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_3385483281", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_3385483281.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0516679440_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0516679440", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0516679440.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_1447841950_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_1447841950", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_1447841950.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_1468938921_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_1468938921", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_1468938921.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_3365012493_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_3365012493", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_3365012493.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_2846276602_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_2846276602", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_2846276602.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_2147440871_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_2147440871", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_2147440871.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000001255213976_0013635053_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00000000001255213976_0013635053", "isim/MIPS_Test_Bench_isim_par.exe.sim/simprims_ver/m_00000000001255213976_0013635053.didat");
	xsi_register_executes(pe);
}
