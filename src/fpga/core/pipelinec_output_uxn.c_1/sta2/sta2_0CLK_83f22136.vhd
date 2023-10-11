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
-- Submodules: 108
entity sta2_0CLK_83f22136 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_83f22136;
architecture arch of sta2_0CLK_83f22136 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2545_c6_ddc6]
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2545_c1_0a4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2545_c2_c7f7]
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2546_c3_174d[uxn_opcodes_h_l2546_c3_174d]
signal printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_cd29]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2550_c7_2f4c]
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_28e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal t16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal n16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2553_c7_afe9]
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_5507]
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal t16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal n16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2558_c7_7b45]
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_104c]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2561_c7_206a]
signal t16_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2561_c7_206a]
signal n16_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_206a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2561_c7_206a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_206a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_206a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_206a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2561_c7_206a]
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2561_c7_206a]
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2562_c3_2e03]
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_876d]
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal n16_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2565_c7_6cce]
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2568_c11_66ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2568_c7_0c7e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_1e9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2573_c7_1ad7]
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_de8d]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2576_c7_b7b1]
signal n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2576_c7_b7b1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_b7b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_b7b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2576_c7_b7b1]
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_b7b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2576_c7_b7b1]
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2577_c3_01bc]
signal BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2579_c32_e1aa]
signal BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2579_c32_c322]
signal BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2579_c32_9f7a]
signal MUX_uxn_opcodes_h_l2579_c32_9f7a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2579_c32_9f7a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2579_c32_9f7a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2579_c32_9f7a_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2582_c32_7dc4]
signal CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_68d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_3372]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2584_c7_3372]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_3372]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2584_c7_3372]
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2584_c7_3372]
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2586_c21_78e9]
signal BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_7d96]
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2589_c7_4261]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_4261]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6a81( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.ram_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_left,
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_right,
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_return_output);

-- t16_MUX_uxn_opcodes_h_l2545_c2_c7f7
t16_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- n16_MUX_uxn_opcodes_h_l2545_c2_c7f7
n16_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

-- printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d
printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d : entity work.printf_uxn_opcodes_h_l2546_c3_174d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output);

-- t16_MUX_uxn_opcodes_h_l2550_c7_2f4c
t16_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- n16_MUX_uxn_opcodes_h_l2550_c7_2f4c
n16_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output);

-- t16_MUX_uxn_opcodes_h_l2553_c7_afe9
t16_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
t16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- n16_MUX_uxn_opcodes_h_l2553_c7_afe9
n16_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
n16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_left,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_right,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output);

-- t16_MUX_uxn_opcodes_h_l2558_c7_7b45
t16_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
t16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- n16_MUX_uxn_opcodes_h_l2558_c7_7b45
n16_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
n16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output);

-- t16_MUX_uxn_opcodes_h_l2561_c7_206a
t16_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
t16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
t16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
t16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- n16_MUX_uxn_opcodes_h_l2561_c7_206a
n16_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
n16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
n16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
n16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03
BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_left,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_right,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_left,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_right,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output);

-- n16_MUX_uxn_opcodes_h_l2565_c7_6cce
n16_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
n16_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output);

-- n16_MUX_uxn_opcodes_h_l2568_c7_0c7e
n16_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output);

-- n16_MUX_uxn_opcodes_h_l2573_c7_1ad7
n16_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output);

-- n16_MUX_uxn_opcodes_h_l2576_c7_b7b1
n16_MUX_uxn_opcodes_h_l2576_c7_b7b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond,
n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue,
n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse,
n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond,
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc
BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_left,
BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_right,
BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa
BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_left,
BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_right,
BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322
BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_left,
BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_right,
BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_return_output);

-- MUX_uxn_opcodes_h_l2579_c32_9f7a
MUX_uxn_opcodes_h_l2579_c32_9f7a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2579_c32_9f7a_cond,
MUX_uxn_opcodes_h_l2579_c32_9f7a_iftrue,
MUX_uxn_opcodes_h_l2579_c32_9f7a_iffalse,
MUX_uxn_opcodes_h_l2579_c32_9f7a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4
CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_x,
CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_cond,
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_left,
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_right,
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_left,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_right,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed
CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_return_output,
 t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output,
 t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output,
 t16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 n16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output,
 t16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 n16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output,
 t16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 n16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output,
 n16_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output,
 n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output,
 n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output,
 n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_return_output,
 MUX_uxn_opcodes_h_l2579_c32_9f7a_return_output,
 CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_2be5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_af3b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_d50a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_24ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_26cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2566_c3_c1b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_0021 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_c99a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2573_c7_1ad7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c22_cefa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2586_c3_c6dc : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2587_c22_c9b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2569_l2562_l2577_l2554_DUPLICATE_d09d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2541_l2594_DUPLICATE_e60c_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2566_c3_c1b6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2566_c3_c1b6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_c99a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_c99a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_af3b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_af3b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_2be5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_2be5;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_d50a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_d50a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_0021 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_0021;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_24ac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_24ac;
     VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_iffalse := resize(to_signed(-4, 4), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_26cc := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_26cc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_28e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_1e9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_104c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2587_c22_c9b1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2587_c22_c9b1_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2568_c11_66ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_5507] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_left;
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output := BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2573_c7_1ad7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_7d96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_left;
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output := BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output := result.ram_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2569_l2562_l2577_l2554_DUPLICATE_d09d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2569_l2562_l2577_l2554_DUPLICATE_d09d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_68d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_cd29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2545_c6_ddc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_876d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2579_c32_e1aa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_left;
     BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_return_output := BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2586_c21_78e9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_de8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_e1aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_ddc6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_cd29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_28e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_5507_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_104c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_876d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_66ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_1e9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_de8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_68d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_7d96_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2586_c3_c6dc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_78e9_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2569_l2562_l2577_l2554_DUPLICATE_d09d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2569_l2562_l2577_l2554_DUPLICATE_d09d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2569_l2562_l2577_l2554_DUPLICATE_d09d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2587_c22_c9b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2553_l2576_l2550_l2573_l2545_l2568_DUPLICATE_f74c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_b3d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2576_l2550_l2573_l2568_DUPLICATE_4207_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_l2561_l2589_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_fa51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_1e48_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2565_l2561_l2558_l2584_l2553_l2550_l2573_l2545_l2568_DUPLICATE_68d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2586_c3_c6dc;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_3372] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2584_c7_3372] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2584_c7_3372] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_return_output := result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2577_c3_01bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_left;
     BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output := BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2562_c3_2e03] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_left;
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_return_output := BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2579_c32_c322] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_left;
     BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_return_output := BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_4261] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2589_c7_4261] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2545_c1_0a4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_c322_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_2e03_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_01bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2570_l2555_DUPLICATE_25ed_return_output;
     VAR_printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2545_c1_0a4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_4261_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_4261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_3372] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2576_c7_b7b1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_b7b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2584_c7_3372] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;

     -- t16_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     t16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     t16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := t16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- MUX[uxn_opcodes_h_l2579_c32_9f7a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2579_c32_9f7a_cond <= VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_cond;
     MUX_uxn_opcodes_h_l2579_c32_9f7a_iftrue <= VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_iftrue;
     MUX_uxn_opcodes_h_l2579_c32_9f7a_iffalse <= VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_return_output := MUX_uxn_opcodes_h_l2579_c32_9f7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2582_c32_7dc4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_return_output := CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_return_output;

     -- printf_uxn_opcodes_h_l2546_c3_174d[uxn_opcodes_h_l2546_c3_174d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2546_c3_174d_uxn_opcodes_h_l2546_c3_174d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2576_c7_b7b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond;
     n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue;
     n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output := n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue := VAR_MUX_uxn_opcodes_h_l2579_c32_9f7a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_3372_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     -- n16_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2576_c7_b7b1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2582_c22_cefa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c22_cefa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_7dc4_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_b7b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := t16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_b7b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c22_cefa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2576_c7_b7b1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output := result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := t16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_b7b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2573_c7_1ad7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output := result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- n16_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := n16_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_1ad7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2568_c7_0c7e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- t16_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     n16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     n16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := n16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_0c7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := n16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2565_c7_6cce] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output := result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_6cce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := n16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2561_c7_206a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_return_output := result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_206a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2558_c7_7b45] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output := result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_7b45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2553_c7_afe9] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output := result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_afe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2550_c7_2f4c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output := result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- Submodule level 12
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_2f4c_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2545_c2_c7f7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output := result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2541_l2594_DUPLICATE_e60c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2541_l2594_DUPLICATE_e60c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a81(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_c7f7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2541_l2594_DUPLICATE_e60c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2541_l2594_DUPLICATE_e60c_return_output;
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
