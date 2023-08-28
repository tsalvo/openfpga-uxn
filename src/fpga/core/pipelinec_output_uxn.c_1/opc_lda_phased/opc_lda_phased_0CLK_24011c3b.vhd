-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 35
entity opc_lda_phased_0CLK_24011c3b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lda_phased_0CLK_24011c3b;
architecture arch of opc_lda_phased_0CLK_24011c3b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram8_at_t16 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_ram8_at_t16 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l803_c6_b922]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l803_c1_f76e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l806_c7_cafa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l803_c2_aee9]
signal t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output : unsigned(15 downto 0);

-- ram8_at_t16_MUX[uxn_opcodes_phased_h_l803_c2_aee9]
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond : unsigned(0 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l803_c2_aee9]
signal result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l804_c12_c57b]
signal set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l806_c11_e776]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l806_c1_3e47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l809_c7_e9c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l806_c7_cafa]
signal t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(15 downto 0);

-- ram8_at_t16_MUX[uxn_opcodes_phased_h_l806_c7_cafa]
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l806_c7_cafa]
signal result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(0 downto 0);

-- t2_register[uxn_opcodes_phased_h_l807_c9_1660]
signal t2_register_uxn_opcodes_phased_h_l807_c9_1660_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_ptr : unsigned(7 downto 0);
signal t2_register_uxn_opcodes_phased_h_l807_c9_1660_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l809_c11_b291]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l809_c1_6e2c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l813_c7_93a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l809_c7_e9c5]
signal t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(15 downto 0);

-- ram8_at_t16_MUX[uxn_opcodes_phased_h_l809_c7_e9c5]
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l809_c7_e9c5]
signal result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(0 downto 0);

-- t2_register[uxn_opcodes_phased_h_l810_c9_061a]
signal t2_register_uxn_opcodes_phased_h_l810_c9_061a_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_ptr : unsigned(7 downto 0);
signal t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output : unsigned(15 downto 0);

-- peek_ram[uxn_opcodes_phased_h_l811_c17_c973]
signal peek_ram_uxn_opcodes_phased_h_l811_c17_c973_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l811_c17_c973_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l811_c17_c973_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l813_c11_7690]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l813_c1_ebe2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l817_c7_d30c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output : unsigned(0 downto 0);

-- ram8_at_t16_MUX[uxn_opcodes_phased_h_l813_c7_93a0]
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond : unsigned(0 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse : unsigned(7 downto 0);
signal ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l813_c7_93a0]
signal result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_opcodes_phased_h_l814_c17_366e]
signal peek_ram_uxn_opcodes_phased_h_l814_c17_366e_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l814_c17_366e_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l814_c17_366e_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_phased_h_l815_c3_46c6]
signal set_uxn_opcodes_phased_h_l815_c3_46c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l815_c3_46c6_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l815_c3_46c6_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l815_c3_46c6_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l815_c3_46c6_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l815_c3_46c6_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l815_c3_46c6_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l817_c11_aa4a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l817_c1_ecb8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l817_c7_d30c]
signal result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l818_c3_f6bf]
signal put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l820_c11_fe38]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l820_c7_19f1]
signal result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922
BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9
t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond,
t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue,
t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse,
t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output);

-- ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9
ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output);

-- result_MUX_uxn_opcodes_phased_h_l803_c2_aee9
result_MUX_uxn_opcodes_phased_h_l803_c2_aee9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond,
result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue,
result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse,
result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b
set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_sp,
set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_k,
set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_mul,
set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_add,
set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776
BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa
t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond,
t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue,
t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse,
t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output);

-- ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa
ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output);

-- result_MUX_uxn_opcodes_phased_h_l806_c7_cafa
result_MUX_uxn_opcodes_phased_h_l806_c7_cafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond,
result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue,
result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse,
result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output);

-- t2_register_uxn_opcodes_phased_h_l807_c9_1660
t2_register_uxn_opcodes_phased_h_l807_c9_1660 : entity work.t2_register_0CLK_a2cd5ea9 port map (
clk,
t2_register_uxn_opcodes_phased_h_l807_c9_1660_CLOCK_ENABLE,
t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_index,
t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_ptr,
t2_register_uxn_opcodes_phased_h_l807_c9_1660_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291
BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5
t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond,
t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue,
t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse,
t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output);

-- ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5
ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output);

-- result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5
result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond,
result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue,
result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse,
result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output);

-- t2_register_uxn_opcodes_phased_h_l810_c9_061a
t2_register_uxn_opcodes_phased_h_l810_c9_061a : entity work.t2_register_0CLK_a2cd5ea9 port map (
clk,
t2_register_uxn_opcodes_phased_h_l810_c9_061a_CLOCK_ENABLE,
t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_index,
t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_ptr,
t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output);

-- peek_ram_uxn_opcodes_phased_h_l811_c17_c973
peek_ram_uxn_opcodes_phased_h_l811_c17_c973 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_phased_h_l811_c17_c973_CLOCK_ENABLE,
peek_ram_uxn_opcodes_phased_h_l811_c17_c973_address,
peek_ram_uxn_opcodes_phased_h_l811_c17_c973_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690
BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output);

-- ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0
ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse,
ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output);

-- result_MUX_uxn_opcodes_phased_h_l813_c7_93a0
result_MUX_uxn_opcodes_phased_h_l813_c7_93a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond,
result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue,
result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse,
result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output);

-- peek_ram_uxn_opcodes_phased_h_l814_c17_366e
peek_ram_uxn_opcodes_phased_h_l814_c17_366e : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_phased_h_l814_c17_366e_CLOCK_ENABLE,
peek_ram_uxn_opcodes_phased_h_l814_c17_366e_address,
peek_ram_uxn_opcodes_phased_h_l814_c17_366e_return_output);

-- set_uxn_opcodes_phased_h_l815_c3_46c6
set_uxn_opcodes_phased_h_l815_c3_46c6 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l815_c3_46c6_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l815_c3_46c6_sp,
set_uxn_opcodes_phased_h_l815_c3_46c6_stack_index,
set_uxn_opcodes_phased_h_l815_c3_46c6_ins,
set_uxn_opcodes_phased_h_l815_c3_46c6_k,
set_uxn_opcodes_phased_h_l815_c3_46c6_mul,
set_uxn_opcodes_phased_h_l815_c3_46c6_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a
BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_return_output);

-- result_MUX_uxn_opcodes_phased_h_l817_c7_d30c
result_MUX_uxn_opcodes_phased_h_l817_c7_d30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond,
result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue,
result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse,
result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output);

-- put_stack_uxn_opcodes_phased_h_l818_c3_f6bf
put_stack_uxn_opcodes_phased_h_l818_c3_f6bf : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_sp,
put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_stack_index,
put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_offset,
put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38
BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_return_output);

-- result_MUX_uxn_opcodes_phased_h_l820_c7_19f1
result_MUX_uxn_opcodes_phased_h_l820_c7_19f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_cond,
result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iftrue,
result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iffalse,
result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 ram8_at_t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output,
 t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output,
 ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output,
 result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output,
 set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output,
 t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output,
 ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output,
 result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output,
 t2_register_uxn_opcodes_phased_h_l807_c9_1660_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output,
 t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output,
 ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output,
 result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output,
 t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output,
 peek_ram_uxn_opcodes_phased_h_l811_c17_c973_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output,
 ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output,
 result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output,
 peek_ram_uxn_opcodes_phased_h_l814_c17_366e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_return_output,
 result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_return_output,
 result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond : unsigned(0 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_ptr : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_ptr : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse : unsigned(0 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_ram8_at_t16 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_ram8_at_t16 := ram8_at_t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_add := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iffalse := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_mul := resize(to_unsigned(2, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_add := resize(to_signed(-1, 2), 8);
     VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_left := VAR_phase;
     VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_value := ram8_at_t16;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue := ram8_at_t16;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue := ram8_at_t16;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse := ram8_at_t16;
     VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iffalse := result;
     VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_sp := VAR_sp;
     VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_ptr := VAR_sp;
     VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_ptr := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_index := VAR_stack_index;
     VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_address := t16;
     VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l806_c11_e776] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l813_c11_7690] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l809_c11_b291] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l820_c11_fe38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l803_c6_b922] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l817_c11_aa4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l803_c6_b922_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l806_c11_e776_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l809_c11_b291_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l813_c11_7690_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l817_c11_aa4a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l820_c11_fe38_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l820_c7_19f1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_cond;
     result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iftrue;
     result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_return_output := result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l806_c7_cafa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l803_c1_f76e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l803_c1_f76e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l820_c7_19f1_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l817_c7_d30c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond;
     result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output := result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l806_c1_3e47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l809_c7_e9c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l804_c12_c57b] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_sp;
     set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_k;
     set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_mul;
     set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_return_output := set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;
     VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l806_c1_3e47_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l804_c12_c57b_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l813_c7_93a0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond;
     result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue;
     result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output := result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l813_c7_93a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l809_c1_6e2c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output;

     -- t2_register[uxn_opcodes_phased_h_l807_c9_1660] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_phased_h_l807_c9_1660_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_index <= VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_index;
     t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_ptr <= VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_stack_ptr;
     -- Outputs
     VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_return_output := t2_register_uxn_opcodes_phased_h_l807_c9_1660_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output;
     VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output;
     VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l809_c1_6e2c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue := VAR_t2_register_uxn_opcodes_phased_h_l807_c9_1660_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l809_c7_e9c5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond;
     result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue;
     result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output := result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;

     -- t2_register[uxn_opcodes_phased_h_l810_c9_061a] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_phased_h_l810_c9_061a_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_index <= VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_index;
     t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_ptr <= VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_stack_ptr;
     -- Outputs
     VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output := t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l813_c1_ebe2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l817_c7_d30c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c7_d30c_return_output;
     VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output;
     VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l813_c1_ebe2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;
     VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_address := VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue := VAR_t2_register_uxn_opcodes_phased_h_l810_c9_061a_return_output;
     -- peek_ram[uxn_opcodes_phased_h_l814_c17_366e] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_phased_h_l814_c17_366e_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_phased_h_l814_c17_366e_address <= VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_return_output := peek_ram_uxn_opcodes_phased_h_l814_c17_366e_return_output;

     -- t16_MUX[uxn_opcodes_phased_h_l809_c7_e9c5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond;
     t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output := t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;

     -- peek_ram[uxn_opcodes_phased_h_l811_c17_c973] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_phased_h_l811_c17_c973_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_phased_h_l811_c17_c973_address <= VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_return_output := peek_ram_uxn_opcodes_phased_h_l811_c17_c973_return_output;

     -- set[uxn_opcodes_phased_h_l815_c3_46c6] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l815_c3_46c6_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l815_c3_46c6_sp <= VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_sp;
     set_uxn_opcodes_phased_h_l815_c3_46c6_stack_index <= VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_stack_index;
     set_uxn_opcodes_phased_h_l815_c3_46c6_ins <= VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_ins;
     set_uxn_opcodes_phased_h_l815_c3_46c6_k <= VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_k;
     set_uxn_opcodes_phased_h_l815_c3_46c6_mul <= VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_mul;
     set_uxn_opcodes_phased_h_l815_c3_46c6_add <= VAR_set_uxn_opcodes_phased_h_l815_c3_46c6_add;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l817_c1_ecb8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l806_c7_cafa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond;
     result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue;
     result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output := result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;

     -- Submodule level 6
     VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l817_c1_ecb8_return_output;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue := VAR_peek_ram_uxn_opcodes_phased_h_l811_c17_c973_return_output;
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue := VAR_peek_ram_uxn_opcodes_phased_h_l814_c17_366e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse := VAR_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;
     -- put_stack[uxn_opcodes_phased_h_l818_c3_f6bf] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_sp <= VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_sp;
     put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_stack_index;
     put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_offset <= VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_offset;
     put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_value <= VAR_put_stack_uxn_opcodes_phased_h_l818_c3_f6bf_value;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l803_c2_aee9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond;
     result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue;
     result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output := result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output;

     -- ram8_at_t16_MUX[uxn_opcodes_phased_h_l813_c7_93a0] LATENCY=0
     -- Inputs
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_cond;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iftrue;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_iffalse;
     -- Outputs
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output := ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output;

     -- t16_MUX[uxn_opcodes_phased_h_l806_c7_cafa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond;
     t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output := t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;

     -- Submodule level 7
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse := VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l813_c7_93a0_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse := VAR_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;
     -- t16_MUX[uxn_opcodes_phased_h_l803_c2_aee9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond;
     t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output := t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output;

     -- ram8_at_t16_MUX[uxn_opcodes_phased_h_l809_c7_e9c5] LATENCY=0
     -- Inputs
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_cond;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iftrue;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_iffalse;
     -- Outputs
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output := ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;

     -- Submodule level 8
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse := VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l809_c7_e9c5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output;
     -- ram8_at_t16_MUX[uxn_opcodes_phased_h_l806_c7_cafa] LATENCY=0
     -- Inputs
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_cond;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iftrue;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_iffalse;
     -- Outputs
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output := ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;

     -- Submodule level 9
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse := VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l806_c7_cafa_return_output;
     -- ram8_at_t16_MUX[uxn_opcodes_phased_h_l803_c2_aee9] LATENCY=0
     -- Inputs
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_cond;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iftrue;
     ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse <= VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_iffalse;
     -- Outputs
     VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output := ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output;

     -- Submodule level 10
     REG_VAR_ram8_at_t16 := VAR_ram8_at_t16_MUX_uxn_opcodes_phased_h_l803_c2_aee9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_ram8_at_t16 <= REG_VAR_ram8_at_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     ram8_at_t16 <= REG_COMB_ram8_at_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
