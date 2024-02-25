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
-- Submodules: 40
entity deo_0CLK_7fa1ddd4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_7fa1ddd4;
architecture arch of deo_0CLK_7fa1ddd4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l497_c6_bf19]
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l497_c2_c10c]
signal t8_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l497_c2_c10c]
signal n8_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l497_c2_c10c]
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : device_out_result_t;

-- result_MUX[uxn_opcodes_h_l497_c2_c10c]
signal result_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l510_c11_c9df]
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_911b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal t8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal n8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : device_out_result_t;

-- result_u8_value_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : signed(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_eb9e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l513_c11_98a8]
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_2bf0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l513_c7_911b]
signal t8_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l513_c7_911b]
signal n8_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l513_c7_911b]
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_return_output : device_out_result_t;

-- result_u8_value_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_return_output : signed(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_911b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l515_c30_1d7b]
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l519_c9_8273]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l519_c9_427a]
signal MUX_uxn_opcodes_h_l519_c9_427a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_427a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_427a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_427a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_6cc3]
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_return_output : unsigned(11 downto 0);

-- device_out[uxn_opcodes_h_l520_c23_e3f2]
signal device_out_uxn_opcodes_h_l520_c23_e3f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_e3f2_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_e3f2_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_e3f2_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_e3f2_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_e3f2_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_e3f2_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4770( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5713( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_device_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19
BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_left,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_right,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- t8_MUX_uxn_opcodes_h_l497_c2_c10c
t8_MUX_uxn_opcodes_h_l497_c2_c10c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l497_c2_c10c_cond,
t8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue,
t8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse,
t8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output);

-- n8_MUX_uxn_opcodes_h_l497_c2_c10c
n8_MUX_uxn_opcodes_h_l497_c2_c10c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l497_c2_c10c_cond,
n8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue,
n8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse,
n8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c
device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond,
device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output);

-- result_MUX_uxn_opcodes_h_l497_c2_c10c
result_MUX_uxn_opcodes_h_l497_c2_c10c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l497_c2_c10c_cond,
result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue,
result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse,
result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df
BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_left,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_right,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- t8_MUX_uxn_opcodes_h_l510_c7_eb9e
t8_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
t8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- n8_MUX_uxn_opcodes_h_l510_c7_eb9e
n8_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
n8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e
device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e
result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e
result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8
BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_left,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_right,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_return_output);

-- t8_MUX_uxn_opcodes_h_l513_c7_911b
t8_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l513_c7_911b_cond,
t8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
t8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
t8_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- n8_MUX_uxn_opcodes_h_l513_c7_911b
n8_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l513_c7_911b_cond,
n8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
n8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
n8_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l513_c7_911b
device_out_result_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_cond,
device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b
result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b
result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b
sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_ins,
sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_x,
sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_y,
sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_return_output);

-- MUX_uxn_opcodes_h_l519_c9_427a
MUX_uxn_opcodes_h_l519_c9_427a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l519_c9_427a_cond,
MUX_uxn_opcodes_h_l519_c9_427a_iftrue,
MUX_uxn_opcodes_h_l519_c9_427a_iffalse,
MUX_uxn_opcodes_h_l519_c9_427a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_left,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_right,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_return_output);

-- device_out_uxn_opcodes_h_l520_c23_e3f2
device_out_uxn_opcodes_h_l520_c23_e3f2 : entity work.device_out_0CLK_001791d5 port map (
clk,
device_out_uxn_opcodes_h_l520_c23_e3f2_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l520_c23_e3f2_device_address,
device_out_uxn_opcodes_h_l520_c23_e3f2_value,
device_out_uxn_opcodes_h_l520_c23_e3f2_phase,
device_out_uxn_opcodes_h_l520_c23_e3f2_previous_device_ram_read,
device_out_uxn_opcodes_h_l520_c23_e3f2_previous_ram_read,
device_out_uxn_opcodes_h_l520_c23_e3f2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 t8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output,
 n8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output,
 result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 t8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 n8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_return_output,
 t8_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 n8_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output,
 sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_return_output,
 MUX_uxn_opcodes_h_l519_c9_427a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_return_output,
 device_out_uxn_opcodes_h_l520_c23_e3f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_c10c_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713_uxn_opcodes_h_l497_c2_c10c_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_470f : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_3105 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_883c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_eb9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_606a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_427a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_427a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_427a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_427a_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_return_output : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_7331_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_909e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_9d94_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_46a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_3a46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_7b08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_99cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e297_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2b6e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_5ac1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e39a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b1bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_171b_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_470f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_883c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_883c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_3105 := resize(to_unsigned(1, 1), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_606a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_606a;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l519_c9_427a_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l519_c9_427a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l515_c30_1d7b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_ins;
     sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_x;
     sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_return_output := sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l497_c2_c10c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_c10c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_470f,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_3105,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_171b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_171b_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l497_c6_bf19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_left;
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output := BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b1bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b1bd_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c9_8273] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_eb9e_return_output := result.stack_address_sp_offset;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_eb9e_return_output := result.sp_relative_shift;

     -- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_6cc3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_left;
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_return_output := BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e297 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e297_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l513_c11_98a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_5ac1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_5ac1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93ce_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l510_c11_c9df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_left;
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output := BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2b6e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2b6e_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e39a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e39a_return_output := result.u16_value;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_bf19_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_c9df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_98a8_return_output;
     VAR_MUX_uxn_opcodes_h_l519_c9_427a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_8273_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_6cc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e39a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e39a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_171b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_171b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_5ac1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_5ac1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93ce_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93ce_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b1bd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_b1bd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2b6e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_2b6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e297_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_e297_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_c10c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_eb9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_eb9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_1d7b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- t8_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     t8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     t8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_return_output := t8_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- MUX[uxn_opcodes_h_l519_c9_427a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l519_c9_427a_cond <= VAR_MUX_uxn_opcodes_h_l519_c9_427a_cond;
     MUX_uxn_opcodes_h_l519_c9_427a_iftrue <= VAR_MUX_uxn_opcodes_h_l519_c9_427a_iftrue;
     MUX_uxn_opcodes_h_l519_c9_427a_iffalse <= VAR_MUX_uxn_opcodes_h_l519_c9_427a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l519_c9_427a_return_output := MUX_uxn_opcodes_h_l519_c9_427a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_value := VAR_MUX_uxn_opcodes_h_l519_c9_427a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_MUX_uxn_opcodes_h_l519_c9_427a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- t8_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := t8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- n8_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     n8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     n8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_return_output := n8_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;
     -- n8_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := n8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- t8_MUX[uxn_opcodes_h_l497_c2_c10c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l497_c2_c10c_cond <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_cond;
     t8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue;
     t8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output := t8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_2bf0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_2bf0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;
     -- device_out[uxn_opcodes_h_l520_c23_e3f2] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l520_c23_e3f2_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l520_c23_e3f2_device_address <= VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_device_address;
     device_out_uxn_opcodes_h_l520_c23_e3f2_value <= VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_value;
     device_out_uxn_opcodes_h_l520_c23_e3f2_phase <= VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_phase;
     device_out_uxn_opcodes_h_l520_c23_e3f2_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_previous_device_ram_read;
     device_out_uxn_opcodes_h_l520_c23_e3f2_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output := device_out_uxn_opcodes_h_l520_c23_e3f2_return_output;

     -- n8_MUX[uxn_opcodes_h_l497_c2_c10c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l497_c2_c10c_cond <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_cond;
     n8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue;
     n8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output := n8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_return_output := device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l526_c29_7b08] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_7b08_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l522_c31_909e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_909e_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l525_c26_3a46] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_3a46_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l527_c24_99cb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_99cb_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l523_c21_9d94] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_9d94_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l524_c22_46a2] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_46a2_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l521_c32_7331] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_7331_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_e3f2_return_output.is_device_ram_write;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_46a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_99cb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_7331_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_3a46_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_7b08_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_909e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_9d94_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l513_c7_911b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output := result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_911b_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l497_c2_c10c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output := device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_eb9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713[uxn_opcodes_h_l497_c2_c10c] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713_uxn_opcodes_h_l497_c2_c10c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5713(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_eb9e_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713_uxn_opcodes_h_l497_c2_c10c_return_output;
     -- result_MUX[uxn_opcodes_h_l497_c2_c10c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l497_c2_c10c_cond <= VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_cond;
     result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_iftrue;
     result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output := result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l497_c2_c10c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
