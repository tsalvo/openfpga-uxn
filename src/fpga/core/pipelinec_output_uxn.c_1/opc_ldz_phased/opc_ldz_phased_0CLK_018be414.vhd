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
entity opc_ldz_phased_0CLK_018be414 is
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
end opc_ldz_phased_0CLK_018be414;
architecture arch of opc_ldz_phased_0CLK_018be414 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram8_at_tmp16 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(15 downto 0);
signal REG_COMB_ram8_at_tmp16 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l681_c6_c4fe]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l681_c1_4cf7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l684_c7_4570]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l681_c2_7609]
signal t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(15 downto 0);

-- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l681_c2_7609]
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l681_c2_7609]
signal tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(7 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(7 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l681_c2_7609]
signal result_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l682_c12_f3e2]
signal set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l684_c11_c7e6]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l684_c1_3a9a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l687_c7_ecf4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l684_c7_4570]
signal t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(15 downto 0);

-- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l684_c7_4570]
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l684_c7_4570]
signal tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(7 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(7 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l684_c7_4570]
signal result_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l685_c8_03fb]
signal t_register_uxn_opcodes_phased_h_l685_c8_03fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l685_c8_03fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l687_c11_ebdf]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l687_c1_9a93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l692_c7_bb1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l687_c7_ecf4]
signal t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(15 downto 0);

-- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l687_c7_ecf4]
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l687_c7_ecf4]
signal tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(7 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(7 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l687_c7_ecf4]
signal result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l688_c8_4f50]
signal t_register_uxn_opcodes_phased_h_l688_c8_4f50_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l688_c8_4f50_return_output : unsigned(7 downto 0);

-- peek_ram[uxn_opcodes_phased_h_l690_c19_82e9]
signal peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l692_c11_1f14]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l692_c1_9bdc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l696_c7_bb30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output : unsigned(0 downto 0);

-- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l692_c7_bb1c]
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond : unsigned(0 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse : unsigned(7 downto 0);
signal ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l692_c7_bb1c]
signal result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_opcodes_phased_h_l693_c19_287d]
signal peek_ram_uxn_opcodes_phased_h_l693_c19_287d_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l693_c19_287d_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l693_c19_287d_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_phased_h_l694_c3_f8b8]
signal set_uxn_opcodes_phased_h_l694_c3_f8b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l694_c3_f8b8_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l694_c3_f8b8_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l694_c3_f8b8_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l694_c3_f8b8_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l694_c3_f8b8_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l694_c3_f8b8_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l696_c11_f191]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l696_c1_6e14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l696_c7_bb30]
signal result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l697_c3_b96a]
signal put_stack_uxn_opcodes_phased_h_l697_c3_b96a_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l697_c3_b96a_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l697_c3_b96a_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l697_c3_b96a_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l697_c3_b96a_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l699_c11_417e]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l699_c7_cf78]
signal result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe
BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l681_c2_7609
t8_MUX_uxn_opcodes_phased_h_l681_c2_7609 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond,
t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue,
t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse,
t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output);

-- ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609
tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond,
tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output);

-- result_MUX_uxn_opcodes_phased_h_l681_c2_7609
result_MUX_uxn_opcodes_phased_h_l681_c2_7609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond,
result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue,
result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse,
result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2
set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_sp,
set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_k,
set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_mul,
set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_add,
set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6
BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l684_c7_4570
t8_MUX_uxn_opcodes_phased_h_l684_c7_4570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond,
t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue,
t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse,
t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output);

-- ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570
tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond,
tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output);

-- result_MUX_uxn_opcodes_phased_h_l684_c7_4570
result_MUX_uxn_opcodes_phased_h_l684_c7_4570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond,
result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue,
result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse,
result_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output);

-- t_register_uxn_opcodes_phased_h_l685_c8_03fb
t_register_uxn_opcodes_phased_h_l685_c8_03fb : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l685_c8_03fb_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_index,
t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_ptr,
t_register_uxn_opcodes_phased_h_l685_c8_03fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf
BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4
t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond,
t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue,
t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse,
t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output);

-- ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4
tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond,
tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output);

-- result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4
result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond,
result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue,
result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse,
result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output);

-- t_register_uxn_opcodes_phased_h_l688_c8_4f50
t_register_uxn_opcodes_phased_h_l688_c8_4f50 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l688_c8_4f50_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_index,
t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_ptr,
t_register_uxn_opcodes_phased_h_l688_c8_4f50_return_output);

-- peek_ram_uxn_opcodes_phased_h_l690_c19_82e9
peek_ram_uxn_opcodes_phased_h_l690_c19_82e9 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_CLOCK_ENABLE,
peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_address,
peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14
BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output);

-- ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse,
ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c
result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond,
result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue,
result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse,
result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output);

-- peek_ram_uxn_opcodes_phased_h_l693_c19_287d
peek_ram_uxn_opcodes_phased_h_l693_c19_287d : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_phased_h_l693_c19_287d_CLOCK_ENABLE,
peek_ram_uxn_opcodes_phased_h_l693_c19_287d_address,
peek_ram_uxn_opcodes_phased_h_l693_c19_287d_return_output);

-- set_uxn_opcodes_phased_h_l694_c3_f8b8
set_uxn_opcodes_phased_h_l694_c3_f8b8 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l694_c3_f8b8_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l694_c3_f8b8_sp,
set_uxn_opcodes_phased_h_l694_c3_f8b8_stack_index,
set_uxn_opcodes_phased_h_l694_c3_f8b8_ins,
set_uxn_opcodes_phased_h_l694_c3_f8b8_k,
set_uxn_opcodes_phased_h_l694_c3_f8b8_mul,
set_uxn_opcodes_phased_h_l694_c3_f8b8_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191
BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_return_output);

-- result_MUX_uxn_opcodes_phased_h_l696_c7_bb30
result_MUX_uxn_opcodes_phased_h_l696_c7_bb30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond,
result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue,
result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse,
result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output);

-- put_stack_uxn_opcodes_phased_h_l697_c3_b96a
put_stack_uxn_opcodes_phased_h_l697_c3_b96a : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l697_c3_b96a_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l697_c3_b96a_sp,
put_stack_uxn_opcodes_phased_h_l697_c3_b96a_stack_index,
put_stack_uxn_opcodes_phased_h_l697_c3_b96a_offset,
put_stack_uxn_opcodes_phased_h_l697_c3_b96a_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e
BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l699_c7_cf78
result_MUX_uxn_opcodes_phased_h_l699_c7_cf78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_cond,
result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iftrue,
result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iffalse,
result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_return_output);



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
 t8,
 ram8_at_tmp16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output,
 t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output,
 ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output,
 result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output,
 set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output,
 t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output,
 ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output,
 result_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output,
 t_register_uxn_opcodes_phased_h_l685_c8_03fb_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output,
 t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output,
 ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output,
 result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output,
 t_register_uxn_opcodes_phased_h_l688_c8_4f50_return_output,
 peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output,
 ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output,
 result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output,
 peek_ram_uxn_opcodes_phased_h_l693_c19_287d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_return_output,
 result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_return_output,
 result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(15 downto 0);
 variable VAR_t8_uxn_opcodes_phased_h_l685_c3_a3f6 : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(15 downto 0);
 variable VAR_t8_uxn_opcodes_phased_h_l688_c3_67ac : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp16_uxn_opcodes_phased_h_l689_c3_fbe8 : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_phased_h_l689_c11_e823_return_output : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse : unsigned(0 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse : unsigned(7 downto 0);
 variable VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(15 downto 0);
variable REG_VAR_ram8_at_tmp16 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_ram8_at_tmp16 := ram8_at_tmp16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_mul := resize(to_unsigned(1, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iffalse := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_mul := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_right := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_right := to_unsigned(2, 2);
     VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_offset := resize(to_unsigned(0, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_left := VAR_phase;
     VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_value := ram8_at_tmp16;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue := ram8_at_tmp16;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue := ram8_at_tmp16;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse := ram8_at_tmp16;
     VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iffalse := result;
     VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_ptr := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_ptr := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_index := VAR_stack_index;
     VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse := t8;
     VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_address := resize(tmp16, 16);
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l699_c11_417e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l692_c11_1f14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l687_c11_ebdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l681_c6_c4fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l696_c11_f191] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l684_c11_c7e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l681_c6_c4fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l684_c11_c7e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l687_c11_ebdf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l692_c11_1f14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l696_c11_f191_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l699_c11_417e_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l699_c7_cf78] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_cond;
     result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iftrue;
     result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_return_output := result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l684_c7_4570] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l681_c1_4cf7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l681_c1_4cf7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l699_c7_cf78_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l684_c1_3a9a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l696_c7_bb30] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond;
     result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue;
     result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output := result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l682_c12_f3e2] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_sp;
     set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_k;
     set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_mul;
     set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_return_output := set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l687_c7_ecf4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l684_c1_3a9a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l682_c12_f3e2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l692_c7_bb1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l692_c7_bb1c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond;
     result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output := result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output;

     -- t_register[uxn_opcodes_phased_h_l685_c8_03fb] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l685_c8_03fb_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_index;
     t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_return_output := t_register_uxn_opcodes_phased_h_l685_c8_03fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l687_c1_9a93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output;
     VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l687_c1_9a93_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output;
     VAR_t8_uxn_opcodes_phased_h_l685_c3_a3f6 := resize(VAR_t_register_uxn_opcodes_phased_h_l685_c8_03fb_return_output, 16);
     VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue := VAR_t8_uxn_opcodes_phased_h_l685_c3_a3f6;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l696_c7_bb30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l692_c1_9bdc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l687_c7_ecf4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond;
     result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue;
     result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output := result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;

     -- t_register[uxn_opcodes_phased_h_l688_c8_4f50] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l688_c8_4f50_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_index;
     t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_return_output := t_register_uxn_opcodes_phased_h_l688_c8_4f50_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c7_bb30_return_output;
     VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output;
     VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l692_c1_9bdc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;
     VAR_t8_uxn_opcodes_phased_h_l688_c3_67ac := resize(VAR_t_register_uxn_opcodes_phased_h_l688_c8_4f50_return_output, 16);
     VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue := VAR_t8_uxn_opcodes_phased_h_l688_c3_67ac;
     -- CAST_TO_uint16_t[uxn_opcodes_phased_h_l689_c11_e823] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_phased_h_l689_c11_e823_return_output := CAST_TO_uint16_t_uint16_t(
     VAR_t8_uxn_opcodes_phased_h_l688_c3_67ac);

     -- result_MUX[uxn_opcodes_phased_h_l684_c7_4570] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond;
     result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue;
     result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output := result_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l696_c1_6e14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_return_output;

     -- peek_ram[uxn_opcodes_phased_h_l693_c19_287d] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_phased_h_l693_c19_287d_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_phased_h_l693_c19_287d_address <= VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_return_output := peek_ram_uxn_opcodes_phased_h_l693_c19_287d_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l687_c7_ecf4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond;
     t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output := t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;

     -- set[uxn_opcodes_phased_h_l694_c3_f8b8] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l694_c3_f8b8_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l694_c3_f8b8_sp <= VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_sp;
     set_uxn_opcodes_phased_h_l694_c3_f8b8_stack_index <= VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_stack_index;
     set_uxn_opcodes_phased_h_l694_c3_f8b8_ins <= VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_ins;
     set_uxn_opcodes_phased_h_l694_c3_f8b8_k <= VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_k;
     set_uxn_opcodes_phased_h_l694_c3_f8b8_mul <= VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_mul;
     set_uxn_opcodes_phased_h_l694_c3_f8b8_add <= VAR_set_uxn_opcodes_phased_h_l694_c3_f8b8_add;
     -- Outputs

     -- Submodule level 6
     VAR_tmp16_uxn_opcodes_phased_h_l689_c3_fbe8 := resize(VAR_CAST_TO_uint16_t_uxn_opcodes_phased_h_l689_c11_e823_return_output, 8);
     VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l696_c1_6e14_return_output;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue := VAR_peek_ram_uxn_opcodes_phased_h_l693_c19_287d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;
     VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_address := resize(VAR_tmp16_uxn_opcodes_phased_h_l689_c3_fbe8, 16);
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue := VAR_tmp16_uxn_opcodes_phased_h_l689_c3_fbe8;
     -- tmp16_MUX[uxn_opcodes_phased_h_l687_c7_ecf4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output := tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;

     -- peek_ram[uxn_opcodes_phased_h_l690_c19_82e9] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_address <= VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_return_output := peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l681_c2_7609] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond;
     result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue;
     result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output := result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;

     -- put_stack[uxn_opcodes_phased_h_l697_c3_b96a] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l697_c3_b96a_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l697_c3_b96a_sp <= VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_sp;
     put_stack_uxn_opcodes_phased_h_l697_c3_b96a_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_stack_index;
     put_stack_uxn_opcodes_phased_h_l697_c3_b96a_offset <= VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_offset;
     put_stack_uxn_opcodes_phased_h_l697_c3_b96a_value <= VAR_put_stack_uxn_opcodes_phased_h_l697_c3_b96a_value;
     -- Outputs

     -- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l692_c7_bb1c] LATENCY=0
     -- Inputs
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_cond;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iftrue;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_iffalse;
     -- Outputs
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output := ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l684_c7_4570] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond;
     t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output := t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;

     -- Submodule level 7
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue := VAR_peek_ram_uxn_opcodes_phased_h_l690_c19_82e9_return_output;
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse := VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l692_c7_bb1c_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse := VAR_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;
     -- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l687_c7_ecf4] LATENCY=0
     -- Inputs
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_cond;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iftrue;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_iffalse;
     -- Outputs
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output := ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l681_c2_7609] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond;
     t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output := t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;

     -- tmp16_MUX[uxn_opcodes_phased_h_l684_c7_4570] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output := tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;

     -- Submodule level 8
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse := VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l687_c7_ecf4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse := VAR_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;
     -- tmp16_MUX[uxn_opcodes_phased_h_l681_c2_7609] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output := tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;

     -- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l684_c7_4570] LATENCY=0
     -- Inputs
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_cond;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iftrue;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_iffalse;
     -- Outputs
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output := ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;

     -- Submodule level 9
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse := VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l684_c7_4570_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;
     -- ram8_at_tmp16_MUX[uxn_opcodes_phased_h_l681_c2_7609] LATENCY=0
     -- Inputs
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_cond;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iftrue;
     ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse <= VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_iffalse;
     -- Outputs
     VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output := ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;

     -- Submodule level 10
     REG_VAR_ram8_at_tmp16 := VAR_ram8_at_tmp16_MUX_uxn_opcodes_phased_h_l681_c2_7609_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_ram8_at_tmp16 <= REG_VAR_ram8_at_tmp16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     ram8_at_tmp16 <= REG_COMB_ram8_at_tmp16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
