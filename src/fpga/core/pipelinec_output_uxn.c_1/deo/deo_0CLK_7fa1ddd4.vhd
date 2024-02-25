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
-- BIN_OP_EQ[uxn_opcodes_h_l497_c6_1eda]
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_2f30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l497_c2_7bff]
signal t8_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l497_c2_7bff]
signal result_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : opcode_result_t;

-- device_out_result_MUX[uxn_opcodes_h_l497_c2_7bff]
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l497_c2_7bff]
signal n8_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l510_c11_634f]
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_0890]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l510_c7_2f30]
signal t8_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_2f30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l510_c7_2f30]
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l510_c7_2f30]
signal n8_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l513_c11_3864]
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_01d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l513_c7_0890]
signal t8_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l513_c7_0890]
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(15 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l513_c7_0890]
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l513_c7_0890]
signal n8_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l515_c30_9ade]
signal sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l519_c9_dba9]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l519_c9_e35d]
signal MUX_uxn_opcodes_h_l519_c9_e35d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_e35d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_e35d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_e35d_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_7719]
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_return_output : unsigned(11 downto 0);

-- device_out[uxn_opcodes_h_l520_c23_f03c]
signal device_out_uxn_opcodes_h_l520_c23_f03c_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_f03c_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_f03c_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_f03c_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_f03c_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_f03c_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_f03c_return_output : device_out_result_t;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2d49( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda
BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_left,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_right,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- t8_MUX_uxn_opcodes_h_l497_c2_7bff
t8_MUX_uxn_opcodes_h_l497_c2_7bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l497_c2_7bff_cond,
t8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue,
t8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse,
t8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output);

-- result_MUX_uxn_opcodes_h_l497_c2_7bff
result_MUX_uxn_opcodes_h_l497_c2_7bff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l497_c2_7bff_cond,
result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue,
result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse,
result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff
device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond,
device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue,
device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse,
device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output);

-- n8_MUX_uxn_opcodes_h_l497_c2_7bff
n8_MUX_uxn_opcodes_h_l497_c2_7bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l497_c2_7bff_cond,
n8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue,
n8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse,
n8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f
BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_left,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_right,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- t8_MUX_uxn_opcodes_h_l510_c7_2f30
t8_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
t8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
t8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
t8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30
result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30
result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30
device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- n8_MUX_uxn_opcodes_h_l510_c7_2f30
n8_MUX_uxn_opcodes_h_l510_c7_2f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l510_c7_2f30_cond,
n8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue,
n8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse,
n8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864
BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_left,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_right,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_return_output);

-- t8_MUX_uxn_opcodes_h_l513_c7_0890
t8_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l513_c7_0890_cond,
t8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
t8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
t8_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890
result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890
result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_cond,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l513_c7_0890
device_out_result_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_cond,
device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- n8_MUX_uxn_opcodes_h_l513_c7_0890
n8_MUX_uxn_opcodes_h_l513_c7_0890 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l513_c7_0890_cond,
n8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue,
n8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse,
n8_MUX_uxn_opcodes_h_l513_c7_0890_return_output);

-- sp_relative_shift_uxn_opcodes_h_l515_c30_9ade
sp_relative_shift_uxn_opcodes_h_l515_c30_9ade : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_ins,
sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_x,
sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_y,
sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9
BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_return_output);

-- MUX_uxn_opcodes_h_l519_c9_e35d
MUX_uxn_opcodes_h_l519_c9_e35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l519_c9_e35d_cond,
MUX_uxn_opcodes_h_l519_c9_e35d_iftrue,
MUX_uxn_opcodes_h_l519_c9_e35d_iffalse,
MUX_uxn_opcodes_h_l519_c9_e35d_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_left,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_right,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_return_output);

-- device_out_uxn_opcodes_h_l520_c23_f03c
device_out_uxn_opcodes_h_l520_c23_f03c : entity work.device_out_0CLK_001791d5 port map (
clk,
device_out_uxn_opcodes_h_l520_c23_f03c_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l520_c23_f03c_device_address,
device_out_uxn_opcodes_h_l520_c23_f03c_value,
device_out_uxn_opcodes_h_l520_c23_f03c_phase,
device_out_uxn_opcodes_h_l520_c23_f03c_previous_device_ram_read,
device_out_uxn_opcodes_h_l520_c23_f03c_previous_ram_read,
device_out_uxn_opcodes_h_l520_c23_f03c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 t8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output,
 result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output,
 device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output,
 n8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 t8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 n8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_return_output,
 t8_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 n8_MUX_uxn_opcodes_h_l513_c7_0890_return_output,
 sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_return_output,
 MUX_uxn_opcodes_h_l519_c9_e35d_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_return_output,
 device_out_uxn_opcodes_h_l520_c23_f03c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_7bff_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49_uxn_opcodes_h_l497_c2_7bff_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_9030 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_b6af : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_2f30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_cbec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_b986 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_e35d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_e35d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_e35d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_e35d_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_f03c_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_f03c_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_f03c_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_f03c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_f03c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_return_output : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_f03c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_aec7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_dc22_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_c571_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_d25f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_0039_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_26a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_ed17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_4204_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_31a5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fecd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_7e75_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0f39_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_13a4_return_output : unsigned(15 downto 0);
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_b6af := resize(to_unsigned(1, 1), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_9030 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_cbec := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_cbec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_b986 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_b986;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l519_c9_e35d_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l520_c23_f03c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_f03c_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l519_c9_e35d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_f03c_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_2f30_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_4204 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_4204_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l510_c11_634f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_left;
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output := BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l513_c11_3864] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_left;
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output := BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_31a5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_31a5_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l515_c30_9ade] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_ins;
     sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_x <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_x;
     sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_y <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_return_output := sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_7719] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_left;
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_return_output := BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fecd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fecd_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_7e75 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_7e75_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l497_c6_1eda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_left;
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output := BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_13a4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_13a4_return_output := result.u16_value;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_2f30_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0f39 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0f39_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c9_dba9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93bf_return_output := result.is_opc_done;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l497_c2_7bff] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_7bff_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_9030,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_b6af,
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_1eda_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_634f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_3864_return_output;
     VAR_MUX_uxn_opcodes_h_l519_c9_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_dba9_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_f03c_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_7719_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_13a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_13a4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_4204_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_4204_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_93bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0f39_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_0f39_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fecd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_fecd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_7e75_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_7e75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_31a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l510_l513_DUPLICATE_31a5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_7bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_2f30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_2f30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_9ade_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- MUX[uxn_opcodes_h_l519_c9_e35d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l519_c9_e35d_cond <= VAR_MUX_uxn_opcodes_h_l519_c9_e35d_cond;
     MUX_uxn_opcodes_h_l519_c9_e35d_iftrue <= VAR_MUX_uxn_opcodes_h_l519_c9_e35d_iftrue;
     MUX_uxn_opcodes_h_l519_c9_e35d_iffalse <= VAR_MUX_uxn_opcodes_h_l519_c9_e35d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l519_c9_e35d_return_output := MUX_uxn_opcodes_h_l519_c9_e35d_return_output;

     -- t8_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     t8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     t8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_return_output := t8_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_f03c_value := VAR_MUX_uxn_opcodes_h_l519_c9_e35d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_MUX_uxn_opcodes_h_l519_c9_e35d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_t8_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- t8_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     t8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     t8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := t8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- n8_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     n8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     n8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_return_output := n8_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_n8_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse := VAR_t8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;
     -- n8_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     n8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     n8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := n8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- t8_MUX[uxn_opcodes_h_l497_c2_7bff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l497_c2_7bff_cond <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_cond;
     t8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue;
     t8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output := t8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_01d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l520_c23_f03c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_01d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;
     -- n8_MUX[uxn_opcodes_h_l497_c2_7bff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l497_c2_7bff_cond <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_cond;
     n8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue;
     n8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output := n8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;

     -- device_out[uxn_opcodes_h_l520_c23_f03c] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l520_c23_f03c_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l520_c23_f03c_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l520_c23_f03c_device_address <= VAR_device_out_uxn_opcodes_h_l520_c23_f03c_device_address;
     device_out_uxn_opcodes_h_l520_c23_f03c_value <= VAR_device_out_uxn_opcodes_h_l520_c23_f03c_value;
     device_out_uxn_opcodes_h_l520_c23_f03c_phase <= VAR_device_out_uxn_opcodes_h_l520_c23_f03c_phase;
     device_out_uxn_opcodes_h_l520_c23_f03c_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_f03c_previous_device_ram_read;
     device_out_uxn_opcodes_h_l520_c23_f03c_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_f03c_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output := device_out_uxn_opcodes_h_l520_c23_f03c_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;
     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l524_c22_d25f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_d25f_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l523_c21_c571] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_c571_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l526_c29_26a4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_26a4_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l522_c31_dc22] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_dc22_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l525_c26_0039] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_0039_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_return_output := device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l527_c24_ed17] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_ed17_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l521_c32_aec7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_aec7_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_f03c_return_output.is_device_ram_write;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_d25f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_ed17_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_aec7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_0039_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_26a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_dc22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_c571_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l513_c7_0890] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_cond;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output := result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_0890_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l497_c2_7bff] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output := device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_2f30] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49[uxn_opcodes_h_l497_c2_7bff] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49_uxn_opcodes_h_l497_c2_7bff_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2d49(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_2f30_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_2f30_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49_uxn_opcodes_h_l497_c2_7bff_return_output;
     -- result_MUX[uxn_opcodes_h_l497_c2_7bff] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l497_c2_7bff_cond <= VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_cond;
     result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue <= VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_iftrue;
     result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse <= VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output := result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l497_c2_7bff_return_output;
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
