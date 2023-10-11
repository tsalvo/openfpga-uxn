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
-- Submodules: 80
entity sta_0CLK_f1f3c8fd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_f1f3c8fd;
architecture arch of sta_0CLK_f1f3c8fd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2500_c6_8cb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2500_c1_e724]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2500_c2_526b]
signal n8_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2500_c2_526b]
signal t16_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2500_c2_526b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2500_c2_526b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2500_c2_526b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2500_c2_526b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2500_c2_526b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2500_c2_526b]
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2500_c2_526b]
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2501_c3_c31b[uxn_opcodes_h_l2501_c3_c31b]
signal printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_bec7]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2505_c7_e3cb]
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2508_c11_08b6]
signal BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2508_c7_c151]
signal n8_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2508_c7_c151]
signal t16_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2508_c7_c151]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2508_c7_c151]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2508_c7_c151]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2508_c7_c151]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2508_c7_c151]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2508_c7_c151]
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2508_c7_c151]
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2510_c3_5f18]
signal CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_3171]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal n8_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal t16_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2513_c7_5b77]
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2516_c11_4e14]
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal n8_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal t16_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2516_c7_51f4]
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2517_c3_d8b4]
signal BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_0de0]
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal n8_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2520_c7_ce83]
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_7166]
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2523_c7_69e0]
signal n8_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2523_c7_69e0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2523_c7_69e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2523_c7_69e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2523_c7_69e0]
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_69e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2523_c7_69e0]
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2526_c32_61f1]
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2526_c32_e67b]
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2526_c32_a18d]
signal MUX_uxn_opcodes_h_l2526_c32_a18d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_a18d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_a18d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2526_c32_a18d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_212c]
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2531_c7_197a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2531_c7_197a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_197a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_return_output);

-- n8_MUX_uxn_opcodes_h_l2500_c2_526b
n8_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
n8_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
n8_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
n8_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- t16_MUX_uxn_opcodes_h_l2500_c2_526b
t16_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
t16_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
t16_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
t16_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

-- printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b
printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b : entity work.printf_uxn_opcodes_h_l2501_c3_c31b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output);

-- n8_MUX_uxn_opcodes_h_l2505_c7_e3cb
n8_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- t16_MUX_uxn_opcodes_h_l2505_c7_e3cb
t16_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_left,
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_right,
BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output);

-- n8_MUX_uxn_opcodes_h_l2508_c7_c151
n8_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
n8_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
n8_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
n8_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- t16_MUX_uxn_opcodes_h_l2508_c7_c151
t16_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
t16_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
t16_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
t16_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18
CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_x,
CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output);

-- n8_MUX_uxn_opcodes_h_l2513_c7_5b77
n8_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
n8_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c7_5b77
t16_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_left,
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_right,
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output);

-- n8_MUX_uxn_opcodes_h_l2516_c7_51f4
n8_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
n8_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- t16_MUX_uxn_opcodes_h_l2516_c7_51f4
t16_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
t16_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4
BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_left,
BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_right,
BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_left,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_right,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output);

-- n8_MUX_uxn_opcodes_h_l2520_c7_ce83
n8_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
n8_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_left,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_right,
BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output);

-- n8_MUX_uxn_opcodes_h_l2523_c7_69e0
n8_MUX_uxn_opcodes_h_l2523_c7_69e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2523_c7_69e0_cond,
n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue,
n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse,
n8_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_cond,
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1
BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_left,
BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_right,
BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b
BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_left,
BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_right,
BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_return_output);

-- MUX_uxn_opcodes_h_l2526_c32_a18d
MUX_uxn_opcodes_h_l2526_c32_a18d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2526_c32_a18d_cond,
MUX_uxn_opcodes_h_l2526_c32_a18d_iftrue,
MUX_uxn_opcodes_h_l2526_c32_a18d_iffalse,
MUX_uxn_opcodes_h_l2526_c32_a18d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_left,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_right,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_return_output,
 n8_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 t16_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output,
 n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output,
 n8_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 t16_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_return_output,
 CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output,
 n8_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output,
 n8_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 t16_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output,
 n8_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output,
 n8_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_return_output,
 MUX_uxn_opcodes_h_l2526_c32_a18d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_b311 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_3e9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_a2ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_1543 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_3d7a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2521_c3_a2e9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_d803_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2538_l2495_DUPLICATE_6296_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_1543 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_1543;
     VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_3d7a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_3d7a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_a2ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_a2ea;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_3e9b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_3e9b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_b311 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_b311;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2521_c3_a2e9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2521_c3_a2e9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_c7_ce83_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_bec7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2516_c11_4e14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_212c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_0de0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2508_c11_08b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_3171] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2526_c32_61f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_left;
     BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_return_output := BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_d803 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_d803_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2523_c11_7166] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_left;
     BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output := BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2500_c6_8cb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2526_c32_61f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2500_c6_8cb7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_bec7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2508_c11_08b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3171_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_4e14_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_0de0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2523_c11_7166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_212c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_d803_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2517_l2509_DUPLICATE_d803_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_5958_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_993a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2523_l2520_l2516_DUPLICATE_58d9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_ace6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2531_l2500_l2520_l2516_DUPLICATE_100a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2513_l2508_l2505_l2500_l2523_l2520_l2516_DUPLICATE_3bf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2520_c7_ce83_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2500_c1_e724] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2523_c7_69e0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output := result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;

     -- n8_MUX[uxn_opcodes_h_l2523_c7_69e0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2523_c7_69e0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_cond;
     n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue;
     n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output := n8_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2517_c3_d8b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_left;
     BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_return_output := BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2531_c7_197a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2526_c32_e67b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_left;
     BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_return_output := BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2510_c3_5f18] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_return_output := CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2523_c7_69e0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_197a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2531_c7_197a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2526_c32_e67b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2517_c3_d8b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2510_c3_5f18_return_output;
     VAR_printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2500_c1_e724_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_197a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2531_c7_197a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2531_c7_197a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     -- MUX[uxn_opcodes_h_l2526_c32_a18d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2526_c32_a18d_cond <= VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_cond;
     MUX_uxn_opcodes_h_l2526_c32_a18d_iftrue <= VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_iftrue;
     MUX_uxn_opcodes_h_l2526_c32_a18d_iffalse <= VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_return_output := MUX_uxn_opcodes_h_l2526_c32_a18d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2523_c7_69e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := t16_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := n8_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2523_c7_69e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2523_c7_69e0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;

     -- printf_uxn_opcodes_h_l2501_c3_c31b[uxn_opcodes_h_l2501_c3_c31b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2501_c3_c31b_uxn_opcodes_h_l2501_c3_c31b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_value_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue := VAR_MUX_uxn_opcodes_h_l2526_c32_a18d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := t16_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- n8_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := n8_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2523_c7_69e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2523_c7_69e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_ce83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := n8_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- t16_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     t16_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     t16_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := t16_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_ce83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     -- n8_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     n8_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     n8_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := n8_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- t16_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2516_c7_51f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_51f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     t16_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     t16_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := t16_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_5b77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_5b77_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;
     -- n8_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     n8_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     n8_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := n8_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2508_c7_c151] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2508_c7_c151_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_e3cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_e3cb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2500_c2_526b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2538_l2495_DUPLICATE_6296 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2538_l2495_DUPLICATE_6296_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a81(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2500_c2_526b_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2500_c2_526b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2538_l2495_DUPLICATE_6296_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l2538_l2495_DUPLICATE_6296_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
