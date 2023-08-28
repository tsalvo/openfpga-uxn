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
-- Submodules: 39
entity opc_str_phased_0CLK_3487a4d6 is
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
end opc_str_phased_0CLK_3487a4d6;
architecture arch of opc_str_phased_0CLK_3487a4d6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l773_c6_24db]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l773_c1_89f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l776_c7_a0bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l773_c2_fa7e]
signal t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l773_c2_fa7e]
signal n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l773_c2_fa7e]
signal tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l773_c2_fa7e]
signal result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l774_c12_c2c1]
signal set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l776_c11_ab2f]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l776_c1_00b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l779_c7_5291]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l776_c7_a0bb]
signal t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l776_c7_a0bb]
signal n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l776_c7_a0bb]
signal tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l776_c7_a0bb]
signal result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l777_c8_d89c]
signal t_register_uxn_opcodes_phased_h_l777_c8_d89c_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l777_c8_d89c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l779_c11_6bdd]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l779_c1_892a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l783_c7_b7ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l779_c7_5291]
signal t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l779_c7_5291]
signal n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l779_c7_5291]
signal tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l779_c7_5291]
signal result_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(0 downto 0);

-- n_register[uxn_opcodes_phased_h_l780_c8_0f95]
signal n_register_uxn_opcodes_phased_h_l780_c8_0f95_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_ptr : unsigned(7 downto 0);
signal n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l781_c11_bb51]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l783_c11_2565]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l783_c1_f0f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l786_c7_9591]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l783_c7_b7ae]
signal n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l783_c7_b7ae]
signal result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output : unsigned(0 downto 0);

-- n_register[uxn_opcodes_phased_h_l784_c8_e0a6]
signal n_register_uxn_opcodes_phased_h_l784_c8_e0a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_ptr : unsigned(7 downto 0);
signal n_register_uxn_opcodes_phased_h_l784_c8_e0a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l786_c11_a416]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l786_c1_2b9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l786_c7_9591]
signal result_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l787_c3_b402]
signal set_uxn_opcodes_phased_h_l787_c3_b402_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l787_c3_b402_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l787_c3_b402_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l787_c3_b402_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l787_c3_b402_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l787_c3_b402_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l787_c3_b402_add : signed(7 downto 0);

-- poke_ram[uxn_opcodes_phased_h_l788_c3_0666]
signal poke_ram_uxn_opcodes_phased_h_l788_c3_0666_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_ram_uxn_opcodes_phased_h_l788_c3_0666_address : unsigned(15 downto 0);
signal poke_ram_uxn_opcodes_phased_h_l788_c3_0666_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l790_c11_a31b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l790_c7_f79d]
signal result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db
BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e
t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond,
t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue,
t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse,
t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e
n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond,
n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue,
n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse,
n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e
tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond,
tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e
result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond,
result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue,
result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse,
result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1
set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_sp,
set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_k,
set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_mul,
set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_add,
set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f
BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb
t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond,
t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue,
t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse,
t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb
n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond,
n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue,
n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse,
n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb
tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond,
tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output);

-- result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb
result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond,
result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue,
result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse,
result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output);

-- t_register_uxn_opcodes_phased_h_l777_c8_d89c
t_register_uxn_opcodes_phased_h_l777_c8_d89c : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l777_c8_d89c_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_index,
t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_ptr,
t_register_uxn_opcodes_phased_h_l777_c8_d89c_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd
BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l779_c7_5291
t8_MUX_uxn_opcodes_phased_h_l779_c7_5291 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond,
t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue,
t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse,
t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l779_c7_5291
n8_MUX_uxn_opcodes_phased_h_l779_c7_5291 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond,
n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue,
n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse,
n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291
tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond,
tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output);

-- result_MUX_uxn_opcodes_phased_h_l779_c7_5291
result_MUX_uxn_opcodes_phased_h_l779_c7_5291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond,
result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue,
result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse,
result_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output);

-- n_register_uxn_opcodes_phased_h_l780_c8_0f95
n_register_uxn_opcodes_phased_h_l780_c8_0f95 : entity work.n_register_0CLK_621d5f60 port map (
clk,
n_register_uxn_opcodes_phased_h_l780_c8_0f95_CLOCK_ENABLE,
n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_index,
n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_ptr,
n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51
BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565
BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae
n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond,
n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue,
n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse,
n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output);

-- result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae
result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond,
result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue,
result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse,
result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output);

-- n_register_uxn_opcodes_phased_h_l784_c8_e0a6
n_register_uxn_opcodes_phased_h_l784_c8_e0a6 : entity work.n_register_0CLK_621d5f60 port map (
clk,
n_register_uxn_opcodes_phased_h_l784_c8_e0a6_CLOCK_ENABLE,
n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_index,
n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_ptr,
n_register_uxn_opcodes_phased_h_l784_c8_e0a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416
BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l786_c7_9591
result_MUX_uxn_opcodes_phased_h_l786_c7_9591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond,
result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue,
result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse,
result_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output);

-- set_uxn_opcodes_phased_h_l787_c3_b402
set_uxn_opcodes_phased_h_l787_c3_b402 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l787_c3_b402_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l787_c3_b402_sp,
set_uxn_opcodes_phased_h_l787_c3_b402_stack_index,
set_uxn_opcodes_phased_h_l787_c3_b402_ins,
set_uxn_opcodes_phased_h_l787_c3_b402_k,
set_uxn_opcodes_phased_h_l787_c3_b402_mul,
set_uxn_opcodes_phased_h_l787_c3_b402_add);

-- poke_ram_uxn_opcodes_phased_h_l788_c3_0666
poke_ram_uxn_opcodes_phased_h_l788_c3_0666 : entity work.poke_ram_0CLK_de264c78 port map (
poke_ram_uxn_opcodes_phased_h_l788_c3_0666_CLOCK_ENABLE,
poke_ram_uxn_opcodes_phased_h_l788_c3_0666_address,
poke_ram_uxn_opcodes_phased_h_l788_c3_0666_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b
BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_return_output);

-- result_MUX_uxn_opcodes_phased_h_l790_c7_f79d
result_MUX_uxn_opcodes_phased_h_l790_c7_f79d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_cond,
result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iftrue,
result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iffalse,
result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_return_output);



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
 tmp16,
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output,
 t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output,
 n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output,
 result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output,
 set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output,
 t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output,
 n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output,
 result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output,
 t_register_uxn_opcodes_phased_h_l777_c8_d89c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output,
 t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output,
 n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output,
 result_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output,
 n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output,
 n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output,
 result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output,
 n_register_uxn_opcodes_phased_h_l784_c8_e0a6_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output,
 result_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_return_output,
 result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_phased_h_l781_c3_c1f5 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_ptr : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l781_c17_cc3d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_ptr : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l787_c3_b402_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l787_c3_b402_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l787_c3_b402_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l787_c3_b402_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l787_c3_b402_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l787_c3_b402_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l787_c3_b402_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_address : unsigned(15 downto 0);
 variable VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_value : unsigned(7 downto 0);
 variable VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l787_c3_b402_add := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_right := to_unsigned(5, 3);
     VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_add := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l787_c3_b402_mul := resize(to_unsigned(2, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l787_c3_b402_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l787_c3_b402_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_k := VAR_k;
     VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse := n8;
     VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_value := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iffalse := result;
     VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_ptr := VAR_sp;
     VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_ptr := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l787_c3_b402_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_ptr := VAR_sp;
     VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_index := VAR_stack_index;
     VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l787_c3_b402_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_index := VAR_stack_index;
     VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse := t8;
     VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_address := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l790_c11_a31b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l786_c11_a416] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l783_c11_2565] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l776_c11_ab2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l779_c11_6bdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l773_c6_24db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l773_c6_24db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l776_c11_ab2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l779_c11_6bdd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l783_c11_2565_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l786_c11_a416_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l790_c11_a31b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l773_c1_89f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l776_c7_a0bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l790_c7_f79d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_cond;
     result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iftrue;
     result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_return_output := result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l773_c1_89f4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l790_c7_f79d_return_output;
     -- set_will_fail[uxn_opcodes_phased_h_l774_c12_c2c1] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_sp;
     set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_k;
     set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_mul;
     set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_return_output := set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l786_c7_9591] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond;
     result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue;
     result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output := result_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l779_c7_5291] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l776_c1_00b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l776_c1_00b7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l774_c12_c2c1_return_output;
     -- t_register[uxn_opcodes_phased_h_l777_c8_d89c] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l777_c8_d89c_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_index;
     t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_return_output := t_register_uxn_opcodes_phased_h_l777_c8_d89c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l779_c1_892a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l783_c7_b7ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l783_c7_b7ae] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond;
     result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue;
     result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output := result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output;
     VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l779_c1_892a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue := VAR_t_register_uxn_opcodes_phased_h_l777_c8_d89c_return_output;
     -- n_register[uxn_opcodes_phased_h_l780_c8_0f95] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_phased_h_l780_c8_0f95_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_index <= VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_index;
     n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_ptr <= VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_stack_ptr;
     -- Outputs
     VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output := n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l779_c7_5291] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond;
     result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue;
     result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output := result_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l783_c1_f0f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l786_c7_9591] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c7_9591_return_output;
     VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l783_c1_f0f3_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue := VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l779_c7_5291] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond;
     t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output := t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l786_c1_2b9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_phased_h_l781_c17_cc3d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l781_c17_cc3d_return_output := CAST_TO_int8_t_uint8_t(
     VAR_n_register_uxn_opcodes_phased_h_l780_c8_0f95_return_output);

     -- n_register[uxn_opcodes_phased_h_l784_c8_e0a6] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_phased_h_l784_c8_e0a6_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_index <= VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_index;
     n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_ptr <= VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_stack_ptr;
     -- Outputs
     VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_return_output := n_register_uxn_opcodes_phased_h_l784_c8_e0a6_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l776_c7_a0bb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond;
     result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue;
     result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output := result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;

     -- Submodule level 6
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_right := VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l781_c17_cc3d_return_output;
     VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output;
     VAR_set_uxn_opcodes_phased_h_l787_c3_b402_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l786_c1_2b9e_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue := VAR_n_register_uxn_opcodes_phased_h_l784_c8_e0a6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l773_c2_fa7e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond;
     result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output := result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;

     -- poke_ram[uxn_opcodes_phased_h_l788_c3_0666] LATENCY=0
     -- Clock enable
     poke_ram_uxn_opcodes_phased_h_l788_c3_0666_CLOCK_ENABLE <= VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_CLOCK_ENABLE;
     -- Inputs
     poke_ram_uxn_opcodes_phased_h_l788_c3_0666_address <= VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_address;
     poke_ram_uxn_opcodes_phased_h_l788_c3_0666_value <= VAR_poke_ram_uxn_opcodes_phased_h_l788_c3_0666_value;
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l781_c11_bb51] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l776_c7_a0bb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond;
     t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output := t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l783_c7_b7ae] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_cond;
     n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output := n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output;

     -- set[uxn_opcodes_phased_h_l787_c3_b402] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l787_c3_b402_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l787_c3_b402_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l787_c3_b402_sp <= VAR_set_uxn_opcodes_phased_h_l787_c3_b402_sp;
     set_uxn_opcodes_phased_h_l787_c3_b402_stack_index <= VAR_set_uxn_opcodes_phased_h_l787_c3_b402_stack_index;
     set_uxn_opcodes_phased_h_l787_c3_b402_ins <= VAR_set_uxn_opcodes_phased_h_l787_c3_b402_ins;
     set_uxn_opcodes_phased_h_l787_c3_b402_k <= VAR_set_uxn_opcodes_phased_h_l787_c3_b402_k;
     set_uxn_opcodes_phased_h_l787_c3_b402_mul <= VAR_set_uxn_opcodes_phased_h_l787_c3_b402_mul;
     set_uxn_opcodes_phased_h_l787_c3_b402_add <= VAR_set_uxn_opcodes_phased_h_l787_c3_b402_add;
     -- Outputs

     -- Submodule level 7
     VAR_tmp16_uxn_opcodes_phased_h_l781_c3_c1f5 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l781_c11_bb51_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l783_c7_b7ae_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue := VAR_tmp16_uxn_opcodes_phased_h_l781_c3_c1f5;
     -- t8_MUX[uxn_opcodes_phased_h_l773_c2_fa7e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond;
     t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output := t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l779_c7_5291] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond;
     n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output := n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;

     -- tmp16_MUX[uxn_opcodes_phased_h_l779_c7_5291] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output := tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;

     -- Submodule level 8
     VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_phased_h_l779_c7_5291_return_output;
     -- tmp16_MUX[uxn_opcodes_phased_h_l776_c7_a0bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output := tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l776_c7_a0bb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_cond;
     n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output := n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;

     -- Submodule level 9
     VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse := VAR_tmp16_MUX_uxn_opcodes_phased_h_l776_c7_a0bb_return_output;
     -- tmp16_MUX[uxn_opcodes_phased_h_l773_c2_fa7e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output := tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l773_c2_fa7e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_cond;
     n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output := n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;

     -- Submodule level 10
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_phased_h_l773_c2_fa7e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
