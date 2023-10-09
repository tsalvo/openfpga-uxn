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
-- Submodules: 107
entity equ2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_3a9c1537;
architecture arch of equ2_0CLK_3a9c1537 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1349_c6_8fdd]
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1349_c1_6379]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal t16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1349_c2_ad73]
signal n16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1350_c3_eb1c[uxn_opcodes_h_l1350_c3_eb1c]
signal printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1355_c11_4523]
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1355_c7_cbf5]
signal n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_7beb]
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal t16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1358_c7_46b9]
signal n16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_d0bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1363_c7_7278]
signal t16_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1363_c7_7278]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_7278]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1363_c7_7278]
signal result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_7278]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_7278]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_7278]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_7278]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1363_c7_7278]
signal n16_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_78c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal t16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1366_c7_ae45]
signal n16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1367_c3_50a1]
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_90ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1370_c7_a339]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_a339]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1370_c7_a339]
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_a339]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_a339]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_a339]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_a339]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1370_c7_a339]
signal n16_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_7d89]
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1373_c7_7f6c]
signal n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_00f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1378_c7_d26f]
signal n16_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_0551]
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1381_c7_d08a]
signal n16_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1382_c3_1369]
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1385_c32_1053]
signal BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1385_c32_1b48]
signal BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1385_c32_4806]
signal MUX_uxn_opcodes_h_l1385_c32_4806_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1385_c32_4806_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1385_c32_4806_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1385_c32_4806_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_2947]
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_202a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1387_c7_202a]
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1387_c7_202a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_202a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1387_c7_202a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1391_c24_0881]
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1391_c24_4952]
signal MUX_uxn_opcodes_h_l1391_c24_4952_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1391_c24_4952_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1391_c24_4952_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1391_c24_4952_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_62cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_b13d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_b13d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd
BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_left,
BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_right,
BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_return_output);

-- t16_MUX_uxn_opcodes_h_l1349_c2_ad73
t16_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
t16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73
result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73
result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- n16_MUX_uxn_opcodes_h_l1349_c2_ad73
n16_MUX_uxn_opcodes_h_l1349_c2_ad73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond,
n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue,
n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse,
n16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

-- printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c
printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c : entity work.printf_uxn_opcodes_h_l1350_c3_eb1c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_left,
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_right,
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output);

-- t16_MUX_uxn_opcodes_h_l1355_c7_cbf5
t16_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5
result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5
result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- n16_MUX_uxn_opcodes_h_l1355_c7_cbf5
n16_MUX_uxn_opcodes_h_l1355_c7_cbf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond,
n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue,
n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse,
n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_left,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_right,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output);

-- t16_MUX_uxn_opcodes_h_l1358_c7_46b9
t16_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
t16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- n16_MUX_uxn_opcodes_h_l1358_c7_46b9
n16_MUX_uxn_opcodes_h_l1358_c7_46b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond,
n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue,
n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse,
n16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output);

-- t16_MUX_uxn_opcodes_h_l1363_c7_7278
t16_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
t16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
t16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
t16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278
result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278
result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- n16_MUX_uxn_opcodes_h_l1363_c7_7278
n16_MUX_uxn_opcodes_h_l1363_c7_7278 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1363_c7_7278_cond,
n16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue,
n16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse,
n16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output);

-- t16_MUX_uxn_opcodes_h_l1366_c7_ae45
t16_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
t16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- n16_MUX_uxn_opcodes_h_l1366_c7_ae45
n16_MUX_uxn_opcodes_h_l1366_c7_ae45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond,
n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue,
n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse,
n16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1
BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_left,
BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_right,
BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- n16_MUX_uxn_opcodes_h_l1370_c7_a339
n16_MUX_uxn_opcodes_h_l1370_c7_a339 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1370_c7_a339_cond,
n16_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue,
n16_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse,
n16_MUX_uxn_opcodes_h_l1370_c7_a339_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_left,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_right,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- n16_MUX_uxn_opcodes_h_l1373_c7_7f6c
n16_MUX_uxn_opcodes_h_l1373_c7_7f6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond,
n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue,
n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse,
n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- n16_MUX_uxn_opcodes_h_l1378_c7_d26f
n16_MUX_uxn_opcodes_h_l1378_c7_d26f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1378_c7_d26f_cond,
n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue,
n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse,
n16_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_left,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_right,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- n16_MUX_uxn_opcodes_h_l1381_c7_d08a
n16_MUX_uxn_opcodes_h_l1381_c7_d08a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1381_c7_d08a_cond,
n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue,
n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse,
n16_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369
BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_left,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_right,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053
BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_left,
BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_right,
BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48
BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_left,
BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_right,
BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_return_output);

-- MUX_uxn_opcodes_h_l1385_c32_4806
MUX_uxn_opcodes_h_l1385_c32_4806 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1385_c32_4806_cond,
MUX_uxn_opcodes_h_l1385_c32_4806_iftrue,
MUX_uxn_opcodes_h_l1385_c32_4806_iffalse,
MUX_uxn_opcodes_h_l1385_c32_4806_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_left,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_right,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881
BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_left,
BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_right,
BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_return_output);

-- MUX_uxn_opcodes_h_l1391_c24_4952
MUX_uxn_opcodes_h_l1391_c24_4952 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1391_c24_4952_cond,
MUX_uxn_opcodes_h_l1391_c24_4952_iftrue,
MUX_uxn_opcodes_h_l1391_c24_4952_iffalse,
MUX_uxn_opcodes_h_l1391_c24_4952_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6
CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_return_output,
 t16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 n16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output,
 t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output,
 t16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 n16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output,
 t16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 n16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output,
 t16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 n16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 n16_MUX_uxn_opcodes_h_l1370_c7_a339_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 n16_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 n16_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_return_output,
 MUX_uxn_opcodes_h_l1385_c32_4806_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_return_output,
 MUX_uxn_opcodes_h_l1391_c24_4952_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_e10a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_7c6c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_8fa3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_6b16 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_d861 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_13af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_48fe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_d032 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_4806_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_4806_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_4806_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_4806_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_0e1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1391_c24_4952_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1391_c24_4952_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1391_c24_4952_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1391_c24_4952_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_17f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1387_DUPLICATE_5c1d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1398_l1345_DUPLICATE_c80a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1391_c24_4952_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_48fe := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_48fe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_7c6c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_7c6c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1385_c32_4806_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1391_c24_4952_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_d032 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_d032;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_6b16 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_6b16;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_0e1d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_0e1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_d861 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_d861;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_13af := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_13af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_e10a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_e10a;
     VAR_MUX_uxn_opcodes_h_l1385_c32_4806_iffalse := resize(to_signed(-3, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_8fa3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_8fa3;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_0551] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_left;
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output := BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_90ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1387_DUPLICATE_5c1d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1387_DUPLICATE_5c1d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_00f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_17f7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_17f7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1391_c24_0881] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_left;
     BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_return_output := BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1355_c11_4523] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_left;
     BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output := BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_7d89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1385_c32_1053] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_left;
     BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_return_output := BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1393_c11_62cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_2947] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_left;
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output := BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1349_c6_8fdd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_7beb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_d0bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_78c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_1053_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c6_8fdd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_4523_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_7beb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_d0bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_78c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_90ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_7d89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_00f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_0551_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2947_return_output;
     VAR_MUX_uxn_opcodes_h_l1391_c24_4952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1391_c24_0881_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1393_c11_62cd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_17f7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_17f7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1374_l1382_l1367_DUPLICATE_17f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1387_l1358_l1381_l1355_l1378_l1373_DUPLICATE_df57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1355_l1378_l1349_l1373_DUPLICATE_fd81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1358_l1381_l1355_l1378_l1373_DUPLICATE_d41c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1370_l1366_l1393_l1363_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_37ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1387_DUPLICATE_5c1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1387_DUPLICATE_5c1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1370_l1366_l1363_l1387_l1358_l1381_l1355_l1378_l1349_l1373_DUPLICATE_adb6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1393_c7_b13d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1382_c3_1369] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_left;
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_return_output := BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_return_output;

     -- MUX[uxn_opcodes_h_l1391_c24_4952] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1391_c24_4952_cond <= VAR_MUX_uxn_opcodes_h_l1391_c24_4952_cond;
     MUX_uxn_opcodes_h_l1391_c24_4952_iftrue <= VAR_MUX_uxn_opcodes_h_l1391_c24_4952_iftrue;
     MUX_uxn_opcodes_h_l1391_c24_4952_iffalse <= VAR_MUX_uxn_opcodes_h_l1391_c24_4952_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1391_c24_4952_return_output := MUX_uxn_opcodes_h_l1391_c24_4952_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1349_c1_6379] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1385_c32_1b48] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_left;
     BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_return_output := BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1393_c7_b13d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1367_c3_50a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_left;
     BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_return_output := BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1387_c7_202a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_202a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1385_c32_4806_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_1b48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_50a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_1369_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_32b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue := VAR_MUX_uxn_opcodes_h_l1391_c24_4952_return_output;
     VAR_printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1349_c1_6379_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1393_c7_b13d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := n16_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- MUX[uxn_opcodes_h_l1385_c32_4806] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1385_c32_4806_cond <= VAR_MUX_uxn_opcodes_h_l1385_c32_4806_cond;
     MUX_uxn_opcodes_h_l1385_c32_4806_iftrue <= VAR_MUX_uxn_opcodes_h_l1385_c32_4806_iftrue;
     MUX_uxn_opcodes_h_l1385_c32_4806_iffalse <= VAR_MUX_uxn_opcodes_h_l1385_c32_4806_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1385_c32_4806_return_output := MUX_uxn_opcodes_h_l1385_c32_4806_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1387_c7_202a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_202a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := t16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1387_c7_202a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;

     -- printf_uxn_opcodes_h_l1350_c3_eb1c[uxn_opcodes_h_l1350_c3_eb1c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1350_c3_eb1c_uxn_opcodes_h_l1350_c3_eb1c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue := VAR_MUX_uxn_opcodes_h_l1385_c32_4806_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_202a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     -- t16_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     t16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     t16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := t16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := n16_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_d08a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_d08a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := t16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_d26f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_d26f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     -- n16_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     n16_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     n16_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := n16_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- t16_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_7f6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_7f6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- t16_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := t16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_a339] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;

     -- n16_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := n16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_a339_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- n16_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     n16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     n16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := n16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_ae45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_ae45_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- n16_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := n16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_7278] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1363_c7_7278_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_46b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_46b9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c7_cbf5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := n16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1355_c7_cbf5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1349_c2_ad73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1398_l1345_DUPLICATE_c80a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1398_l1345_DUPLICATE_c80a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c2_ad73_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1398_l1345_DUPLICATE_c80a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1398_l1345_DUPLICATE_c80a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
