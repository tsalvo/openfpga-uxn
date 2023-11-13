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
-- Submodules: 58
entity rot_0CLK_90cbec6a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_90cbec6a;
architecture arch of rot_0CLK_90cbec6a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2505_c6_ac4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2505_c1_9ba2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2505_c2_2440]
signal t8_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c2_2440]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c2_2440]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c2_2440]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c2_2440]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c2_2440]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2505_c2_2440]
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2505_c2_2440]
signal n8_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2505_c2_2440]
signal l8_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2506_c3_a136[uxn_opcodes_h_l2506_c3_a136]
signal printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_9cd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2510_c7_3099]
signal t8_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_3099]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_3099]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_3099]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_3099]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_3099]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_3099]
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2510_c7_3099]
signal n8_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2510_c7_3099]
signal l8_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_faee]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2513_c7_db01]
signal t8_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_db01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_db01]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_db01]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_db01]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_db01]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_db01]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2513_c7_db01]
signal n8_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2513_c7_db01]
signal l8_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_70c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2517_c7_c4cb]
signal l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2520_c30_6558]
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_c08e]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_a770]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_a770]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_a770]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_a770]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_a770]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2525_c7_a770]
signal l8_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_7764]
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_357b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2531_c7_357b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2531_c7_357b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2531_c7_357b]
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_5a8d]
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_c0c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_c0c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_return_output);

-- t8_MUX_uxn_opcodes_h_l2505_c2_2440
t8_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
t8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
t8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
t8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- n8_MUX_uxn_opcodes_h_l2505_c2_2440
n8_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
n8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
n8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
n8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- l8_MUX_uxn_opcodes_h_l2505_c2_2440
l8_MUX_uxn_opcodes_h_l2505_c2_2440 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2505_c2_2440_cond,
l8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue,
l8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse,
l8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

-- printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136
printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136 : entity work.printf_uxn_opcodes_h_l2506_c3_a136_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output);

-- t8_MUX_uxn_opcodes_h_l2510_c7_3099
t8_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
t8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
t8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
t8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- n8_MUX_uxn_opcodes_h_l2510_c7_3099
n8_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
n8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
n8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
n8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- l8_MUX_uxn_opcodes_h_l2510_c7_3099
l8_MUX_uxn_opcodes_h_l2510_c7_3099 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2510_c7_3099_cond,
l8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue,
l8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse,
l8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output);

-- t8_MUX_uxn_opcodes_h_l2513_c7_db01
t8_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
t8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
t8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
t8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- n8_MUX_uxn_opcodes_h_l2513_c7_db01
n8_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
n8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
n8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
n8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- l8_MUX_uxn_opcodes_h_l2513_c7_db01
l8_MUX_uxn_opcodes_h_l2513_c7_db01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2513_c7_db01_cond,
l8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue,
l8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse,
l8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- n8_MUX_uxn_opcodes_h_l2517_c7_c4cb
n8_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- l8_MUX_uxn_opcodes_h_l2517_c7_c4cb
l8_MUX_uxn_opcodes_h_l2517_c7_c4cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond,
l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue,
l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse,
l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2520_c30_6558
sp_relative_shift_uxn_opcodes_h_l2520_c30_6558 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_ins,
sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_x,
sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_y,
sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_return_output);

-- l8_MUX_uxn_opcodes_h_l2525_c7_a770
l8_MUX_uxn_opcodes_h_l2525_c7_a770 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2525_c7_a770_cond,
l8_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue,
l8_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse,
l8_MUX_uxn_opcodes_h_l2525_c7_a770_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_left,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_right,
BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_left,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_right,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_return_output,
 t8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 n8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 l8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output,
 t8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 n8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 l8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output,
 t8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 n8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 l8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output,
 sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_return_output,
 l8_MUX_uxn_opcodes_h_l2525_c7_a770_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_5640 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_0f6f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_aa9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2522_c3_a92f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_ddab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_0c57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2531_c7_357b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_22fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_4494_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_2b4d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2540_l2501_DUPLICATE_269d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_0c57 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2532_c3_0c57;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2522_c3_a92f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2522_c3_a92f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_0f6f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_0f6f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_5640 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_5640;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_aa9b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_aa9b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_ddab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2528_c3_ddab;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_ins := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_2b4d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_2b4d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_faee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_4494 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_4494_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2520_c30_6558] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_ins;
     sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_x;
     sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_return_output := sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_5a8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2531_c7_357b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2531_c7_357b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_9cd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_c08e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_70c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_22fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_22fd_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c6_ac4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2531_c11_7764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_left;
     BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output := BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c6_ac4d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_9cd8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_faee_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_70c1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c08e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2531_c11_7764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_5a8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_4494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_4494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_4494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2505_l2517_l2510_DUPLICATE_4494_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2531_l2525_l2517_l2513_l2510_l2535_DUPLICATE_0ac2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_22fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_22fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_22fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2525_l2513_l2505_l2510_DUPLICATE_22fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2531_l2525_l2513_l2510_l2505_l2535_DUPLICATE_170b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_2b4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_2b4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_2b4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2531_l2505_l2510_DUPLICATE_2b4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2531_c7_357b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_6558_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_a770] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     t8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     t8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := t8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2531_c7_357b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2505_c1_9ba2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_return_output;

     -- l8_MUX[uxn_opcodes_h_l2525_c7_a770] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2525_c7_a770_cond <= VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_cond;
     l8_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue;
     l8_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_return_output := l8_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output;

     -- n8_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2531_c7_357b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2505_c1_9ba2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_c0c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- l8_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2531_c7_357b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;

     -- printf_uxn_opcodes_h_l2506_c3_a136[uxn_opcodes_h_l2506_c3_a136] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2506_c3_a136_uxn_opcodes_h_l2506_c3_a136_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_a770] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;

     -- t8_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     t8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     t8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := t8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_a770] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2531_c7_357b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     n8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     n8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := n8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- Submodule level 3
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2531_c7_357b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_a770] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;

     -- n8_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     n8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     n8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := n8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_a770] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     t8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     t8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := t8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- l8_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     l8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     l8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := l8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_a770_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_c4cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;

     -- l8_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     l8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     l8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := l8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- n8_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     n8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     n8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := n8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_c4cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     -- l8_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     l8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     l8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := l8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_db01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- Submodule level 6
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_db01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_3099] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_3099_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c2_2440] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2540_l2501_DUPLICATE_269d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2540_l2501_DUPLICATE_269d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c2_2440_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2505_c2_2440_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2540_l2501_DUPLICATE_269d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2540_l2501_DUPLICATE_269d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
